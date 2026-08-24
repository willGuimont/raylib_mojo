"""Raylib [gpu/kernel] example - Real-Time Sphere Raytracing GPU Kernel.

Demonstrates genuine GPU kernel programming in Mojo using MAX DeviceContext & std.gpu.
Launches 120,000 parallel ray casting, sphere intersection, raytraced shadows,
Blinn-Phong specular lighting, Schlick Fresnel, and multi-bounce reflection GPU threads on NVIDIA GPU.
Controls:
  Mouse Left Drag: Orbit 360 camera (yaw & pitch above horizon)
  R: Toggle reflective bounces
"""

from std.math import sin, cos, sqrt, min, max
from std.memory import Pointer
from std.gpu import thread_idx, block_idx, block_dim
from max.gpu.host import DeviceContext
from raylib import (
    init_window,
    window_should_close,
    close_window,
    set_target_fps,
    begin_drawing,
    end_drawing,
    clear_background,
    draw_text,
    draw_fps,
    is_key_pressed,
    is_mouse_button_down,
    get_mouse_position,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    WHITE,
    BLACK,
    GOLD,
    SKYBLUE,
    Color,
    Rectangle,
    Vector2,
    KEY_R,
    MOUSE_BUTTON_LEFT,
)
import raylib.c as c

comptime RENDER_W = 400
comptime RENDER_H = 300
comptime SCREEN_W = 800
comptime SCREEN_H = 600
comptime BLOCK_X = 16
comptime BLOCK_Y = 16
comptime GRID_X = (RENDER_W + BLOCK_X - 1) // BLOCK_X
comptime GRID_Y = (RENDER_H + BLOCK_Y - 1) // BLOCK_Y
comptime TOTAL_PIXELS = RENDER_W * RENDER_H
comptime NUM_SPHERES = 4
comptime dtype = DType.uint32

# ===-----------------------------------------------------------------------===#
# GPU Kernel Vector Struct with Native Mojo Operators
# ===-----------------------------------------------------------------------===#


struct Vec3(ImplicitlyCopyable, TrivialRegisterPassable):
    var x: Float32
    var y: Float32
    var z: Float32

    def __init__(
        out self, x: Float32 = 0.0, y: Float32 = 0.0, z: Float32 = 0.0
    ):
        self.x = x
        self.y = y
        self.z = z

    def dot(self, other: Self) -> Float32:
        return self.x * other.x + self.y * other.y + self.z * other.z

    def cross(self, other: Self) -> Self:
        return Self(
            self.y * other.z - self.z * other.y,
            self.z * other.x - self.x * other.z,
            self.x * other.y - self.y * other.x,
        )

    def length(self) -> Float32:
        return sqrt(self.dot(self))

    def normalize(self) -> Self:
        var len = self.length()
        if len > 0.0001:
            return Self(self.x / len, self.y / len, self.z / len)
        return Self()

    def __add__(self, other: Self) -> Self:
        return Self(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self, other: Self) -> Self:
        return Self(self.x - other.x, self.y - other.y, self.z - other.z)

    def __mul__(self, s: Float32) -> Self:
        return Self(self.x * s, self.y * s, self.z * s)

    def __mul__(self, other: Self) -> Self:
        return Self(self.x * other.x, self.y * other.y, self.z * other.z)

    def __neg__(self) -> Self:
        return Self(-self.x, -self.y, -self.z)


struct Sphere(ImplicitlyCopyable, TrivialRegisterPassable):
    var center: Vec3
    var radius: Float32
    var color: Vec3
    var reflectivity: Float32

    def __init__(
        out self,
        center: Vec3,
        radius: Float32,
        color: Vec3,
        reflectivity: Float32 = 0.0,
    ):
        self.center = center
        self.radius = radius
        self.color = color
        self.reflectivity = reflectivity


def get_sphere(idx: Int) -> Sphere:
    if idx == 0:
        # Sphere 1: Center Gold Metallic Sphere
        return Sphere(Vec3(0.0, 0.0, 0.0), 1.0, Vec3(1.0, 0.8, 0.2), 0.75)
    elif idx == 1:
        # Sphere 2: Left Chrome Mirror Sphere
        return Sphere(Vec3(-2.2, -0.2, 0.5), 0.8, Vec3(0.95, 0.95, 1.0), 0.90)
    elif idx == 2:
        # Sphere 3: Right Emerald Gem Sphere
        return Sphere(Vec3(2.2, -0.2, 0.5), 0.8, Vec3(0.1, 0.85, 0.4), 0.65)
    else:
        # Sphere 4: Front Small Ruby Sphere
        return Sphere(Vec3(0.0, -0.5, 1.8), 0.5, Vec3(0.9, 0.15, 0.2), 0.70)


def is_in_shadow(
    shadow_orig: Vec3, shadow_dir: Vec3, light_dist: Float32
) -> Bool:
    for s_idx in range(NUM_SPHERES):
        var sph = get_sphere(s_idx)
        var oc = shadow_orig - sph.center
        var b = oc.dot(shadow_dir)
        var c_val = oc.dot(oc) - sph.radius * sph.radius
        var disc = b * b - c_val
        if disc > 0.0:
            var t_hit = -b - sqrt(disc)
            if t_hit > 0.001 and t_hit < light_dist:
                return True
    return False


def trace_ray_gpu(
    ray_orig: Vec3,
    ray_dir: Vec3,
    light_pos: Vec3,
    enable_reflections: Int32,
    depth: Int32 = 0,
) -> Vec3:
    if depth > 2:
        return Vec3(0.05, 0.05, 0.08)

    var closest_t: Float32 = 1e30
    var hit_normal = Vec3()
    var hit_point = Vec3()
    var hit_color = Vec3()
    var hit_reflectivity: Float32 = 0.0
    var hit_anything: Bool = False

    # 1. Check Checkered Floor Plane (y = -1.0)
    if ray_dir.y < -0.0001:
        var t = (-1.0 - ray_orig.y) / ray_dir.y
        if t > 0.001 and t < closest_t:
            closest_t = t
            hit_anything = True
            hit_point = ray_orig + ray_dir * t
            hit_normal = Vec3(0.0, 1.0, 0.0)
            hit_reflectivity = 0.40

            var fx = (
                Int(hit_point.x * 0.8) if hit_point.x
                >= 0.0 else Int(hit_point.x * 0.8) - 1
            )
            var fz = (
                Int(hit_point.z * 0.8) if hit_point.z
                >= 0.0 else Int(hit_point.z * 0.8) - 1
            )
            if (fx + fz) % 2 == 0:
                hit_color = Vec3(0.85, 0.85, 0.9)
            else:
                hit_color = Vec3(0.15, 0.18, 0.22)

    # 2. Check Sphere Intersections using Scene Loop
    for s_idx in range(NUM_SPHERES):
        var sph = get_sphere(s_idx)
        var oc = ray_orig - sph.center
        var b = oc.dot(ray_dir)
        var c_val = oc.dot(oc) - sph.radius * sph.radius
        var disc = b * b - c_val
        if disc > 0.0:
            var t1 = -b - sqrt(disc)
            if t1 > 0.001 and t1 < closest_t:
                closest_t = t1
                hit_anything = True
                hit_point = ray_orig + ray_dir * t1
                hit_normal = (hit_point - sph.center).normalize()
                hit_color = sph.color
                hit_reflectivity = sph.reflectivity

    if not hit_anything:
        var unit_dir = ray_dir.normalize()
        var t = 0.5 * (unit_dir.y + 1.0)
        return Vec3(0.6, 0.7, 0.95) * (1.0 - t) + Vec3(0.15, 0.25, 0.55) * t

    # 3. Raytraced Shadows & Blinn-Phong Lighting
    var light_vec = light_pos - hit_point
    var light_dist = light_vec.length()
    var light_dir = light_vec.normalize()

    var shadow_orig = hit_point + hit_normal * 0.002
    var in_shadow = is_in_shadow(shadow_orig, light_dir, light_dist)

    var diff: Float32 = 0.0
    var spec_power: Float32 = 0.0

    if not in_shadow:
        diff = max(Float32(0.0), hit_normal.dot(light_dir))
        var view_dir = (ray_orig - hit_point).normalize()
        var half_dir = (light_dir + view_dir).normalize()
        var spec = max(Float32(0.0), hit_normal.dot(half_dir))
        spec_power = (
            spec * spec * spec * spec * spec * spec * spec * spec
        )  # spec^8

    var ambient = Vec3(0.12, 0.14, 0.18)
    var shaded_color = (
        hit_color * (diff * 0.75 + 0.25)
        + Vec3(1.0, 1.0, 1.0) * (spec_power * 0.6)
        + ambient
    )

    # 4. Schlick's Fresnel & Multi-bounce Reflection Calculation
    if enable_reflections == 1 and hit_reflectivity > 0.0 and depth < 2:
        var cos_theta = max(Float32(0.0), -ray_dir.dot(hit_normal))
        var f_factor = 1.0 - cos_theta
        var fresnel = hit_reflectivity + (1.0 - hit_reflectivity) * (
            f_factor * f_factor * f_factor * f_factor * f_factor
        )

        var dot_dn = ray_dir.dot(hit_normal)
        var refl_dir = (ray_dir - hit_normal * (2.0 * dot_dn)).normalize()
        var refl_orig = hit_point + hit_normal * 0.005
        var refl_color = trace_ray_gpu(
            refl_orig, refl_dir, light_pos, enable_reflections, depth + 1
        )

        var tinted_refl = refl_color * hit_color * 0.5 + refl_color * 0.5
        shaded_color = shaded_color * (1.0 - fresnel) + tinted_refl * fresnel

    _ = closest_t
    return shaded_color


# ===-----------------------------------------------------------------------===#
# GPU Kernel Definition (Executed on CUDA Threads)
# ===-----------------------------------------------------------------------===#


def raytracer_gpu_kernel(
    output: Pointer[Scalar[dtype], MutAnyOrigin],
    width_dev: Int32,
    height_dev: Int32,
    cam_yaw_dev: Float32,
    cam_pitch_dev: Float32,
    light_y_dev: Float32,
    enable_reflections_dev: Int32,
):
    var px = Int32(block_idx.x * block_dim.x + thread_idx.x)
    var py = Int32(block_idx.y * block_dim.y + thread_idx.y)
    var W = width_dev
    var H = height_dev

    if px >= W or py >= H:
        return

    var cam_dist: Float32 = 5.2
    var cy = cos(cam_pitch_dev)
    var sy = sin(cam_pitch_dev)

    var cam_orig = Vec3(
        sin(cam_yaw_dev) * cy * cam_dist,
        sy * cam_dist,
        cos(cam_yaw_dev) * cy * cam_dist,
    )
    var cam_target = Vec3(0.0, -0.1, 0.2)

    var forward = (cam_target - cam_orig).normalize()
    var right = forward.cross(
        Vec3(0.0, 1.0, 0.0)
    ).normalize() if forward.x != 0.0 or forward.z != 0.0 else Vec3(
        1.0, 0.0, 0.0
    )
    var up = right.cross(forward).normalize()

    var light_pos = Vec3(2.5, light_y_dev, 3.5)

    var fy = (0.5 - Float32(py) / Float32(H)) * 0.75
    var fx = (Float32(px) / Float32(W) - 0.5) * 1.0

    var ray_dir = (forward + right * fx + up * fy).normalize()
    var rgb = trace_ray_gpu(
        cam_orig, ray_dir, light_pos, enable_reflections_dev, 0
    )

    # 5. Gamma Correction (sqrt mapping from linear to sRGB)
    var r = UInt32(
        min(
            Float32(255.0),
            max(Float32(0.0), sqrt(max(Float32(0.0), rgb.x)) * 255.0),
        )
    )
    var g = UInt32(
        min(
            Float32(255.0),
            max(Float32(0.0), sqrt(max(Float32(0.0), rgb.y)) * 255.0),
        )
    )
    var b = UInt32(
        min(
            Float32(255.0),
            max(Float32(0.0), sqrt(max(Float32(0.0), rgb.z)) * 255.0),
        )
    )
    var a: UInt32 = 255

    var rgba_val = r | (g << 8) | (b << 16) | (a << 24)
    output[unsafe_offset=Int(py * W + px)] = Scalar[dtype](rgba_val)


def main() raises:
    init_window(
        SCREEN_W,
        SCREEN_H,
        "raylib [gpu] example - sphere raytracing gpu kernel",
    )
    set_target_fps(60)

    var img = c.GenImageColor(RENDER_W, RENDER_H, BLACK())
    var tex = c.LoadTextureFromImage(img)
    c.UnloadImage(img)

    var cam_yaw: Float32 = 0.0
    var cam_pitch: Float32 = 0.3
    var light_y: Float32 = 4.0
    var enable_reflections: Int32 = 1
    var prev_mouse_pos = Vector2()

    with DeviceContext() as ctx:
        var out_buf = ctx.enqueue_create_buffer[dtype](TOTAL_PIXELS)

        while not window_should_close():
            if is_key_pressed(KEY_R):
                enable_reflections = 1 if enable_reflections == 0 else 0

            var mouse_pos = get_mouse_position()
            if is_mouse_button_down(MOUSE_BUTTON_LEFT):
                var dx = mouse_pos.x - prev_mouse_pos.x
                var dy = mouse_pos.y - prev_mouse_pos.y
                cam_yaw += dx * 0.008
                cam_pitch -= dy * 0.008
                # Clamp pitch so camera stays above horizon (0.05 rad to 1.5 rad)
                cam_pitch = max(Float32(0.05), min(Float32(1.5), cam_pitch))
            prev_mouse_pos = mouse_pos

            # Dispatch Mojo GPU Raytracing Kernel across CUDA threads
            ctx.enqueue_function[raytracer_gpu_kernel](
                out_buf,
                Int32(RENDER_W),
                Int32(RENDER_H),
                cam_yaw,
                cam_pitch,
                light_y,
                enable_reflections,
                grid_dim=(GRID_X, GRID_Y),
                block_dim=(BLOCK_X, BLOCK_Y),
            )
            ctx.synchronize()

            # Read back GPU buffer to Raylib Texture
            with out_buf.map_to_host() as host_buf:
                c.UpdateTexture(
                    tex, host_buf.unsafe_ptr().unsafe_bitcast[NoneType]()
                )

            # Render Scaled Texture & UI
            begin_drawing()
            clear_background(BLACK())

            c.DrawTexturePro(
                tex,
                Rectangle(0.0, 0.0, Float32(RENDER_W), Float32(RENDER_H)),
                Rectangle(0.0, 0.0, Float32(SCREEN_W), Float32(SCREEN_H)),
                Vector2(0.0, 0.0),
                0.0,
                WHITE(),
            )

            draw_text(
                "REAL-TIME SPHERE RAYTRACING GPU KERNEL",
                220,
                20,
                20,
                RAYWHITE(),
            )
            draw_text(
                "LEFT MOUSE DRAG: 3D Orbit Camera  |  R: Toggle Reflections",
                170,
                50,
                16,
                RAYWHITE(),
            )

            draw_fps(10, 10)
            end_drawing()

    c.UnloadTexture(tex)
    close_window()

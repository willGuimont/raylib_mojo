"""Raylib [gpu/kernel] example - Gray-Scott Reaction-Diffusion PDE Stencil GPU Kernel.

Demonstrates genuine GPU kernel programming in Mojo using MAX DeviceContext & std.gpu.
Launches 2D Laplacian stencil convolution GPU threads across CUDA blocks on NVIDIA GPU.
Controls:
  Mouse Left Drag: Inject chemical V into grid
  SPACE: Reset chemical grid
  P: Cycle parameter presets (Solitons, Coral, Mitosis)
"""

from std.sys import has_accelerator
from std.math import min, max
from std.memory import Pointer
from std.gpu import thread_idx, block_idx, block_dim
from max.gpu.host import DeviceContext
from std.os import getenv
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
    measure_text,
    take_screenshot,
    is_key_pressed,
    is_mouse_button_down,
    get_mouse_position,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    WHITE,
    BLACK,
    Color,
    Rectangle,
    Vector2,
    KEY_SPACE,
    KEY_P,
    KEY_S,
    MOUSE_BUTTON_LEFT,
)
import raylib.c as c

comptime GRID_W = 200
comptime GRID_H = 150
comptime SCREEN_W = 800
comptime SCREEN_H = 600
comptime BLOCK_X = 16
comptime BLOCK_Y = 16
comptime GRID_X = (GRID_W + BLOCK_X - 1) // BLOCK_X
comptime GRID_Y = (GRID_H + BLOCK_Y - 1) // BLOCK_Y
comptime TOTAL_CELLS = GRID_W * GRID_H
comptime float_dtype = DType.float32
comptime uint_dtype = DType.uint32

# ===-----------------------------------------------------------------------===#
# GPU Kernel Definition (Executed on GPU CUDA Threads)
# ===-----------------------------------------------------------------------===#


def reaction_diffusion_gpu_kernel(
    out_u: Pointer[Scalar[float_dtype], MutAnyOrigin],
    out_v: Pointer[Scalar[float_dtype], MutAnyOrigin],
    out_pixels: Pointer[Scalar[uint_dtype], MutAnyOrigin],
    in_u: Pointer[Scalar[float_dtype], MutAnyOrigin],
    in_v: Pointer[Scalar[float_dtype], MutAnyOrigin],
    width_dev: Int32,
    height_dev: Int32,
    Du_dev: Float32,
    Dv_dev: Float32,
    F_dev: Float32,
    k_dev: Float32,
):
    var x = Int32(block_idx.x * block_dim.x + thread_idx.x)
    var y = Int32(block_idx.y * block_dim.y + thread_idx.y)
    var W = width_dev
    var H = height_dev

    if x >= W or y >= H:
        return

    var x_left = Int((x - 1 + W) % W)
    var x_curr = Int(x)
    var x_right = Int((x + 1) % W)

    var y_up = Int(((y - 1 + H) % H) * W)
    var y_curr = Int(y * W)
    var y_down = Int(((y + 1) % H) * W)

    var idx = Int(y_curr + x_curr)

    # 9-Point 2D Laplacian Stencil Convolution Kernel
    var u_val = in_u[unsafe_offset=idx]
    var v_val = in_v[unsafe_offset=idx]

    var lap_u = (
        in_u[unsafe_offset=y_curr + x_left] * 0.2
        + in_u[unsafe_offset=y_curr + x_right] * 0.2
        + in_u[unsafe_offset=y_up + x_curr] * 0.2
        + in_u[unsafe_offset=y_down + x_curr] * 0.2
        + in_u[unsafe_offset=y_up + x_left] * 0.05
        + in_u[unsafe_offset=y_up + x_right] * 0.05
        + in_u[unsafe_offset=y_down + x_left] * 0.05
        + in_u[unsafe_offset=y_down + x_right] * 0.05
        - u_val * 1.0
    )

    var lap_v = (
        in_v[unsafe_offset=y_curr + x_left] * 0.2
        + in_v[unsafe_offset=y_curr + x_right] * 0.2
        + in_v[unsafe_offset=y_up + x_curr] * 0.2
        + in_v[unsafe_offset=y_down + x_curr] * 0.2
        + in_v[unsafe_offset=y_up + x_left] * 0.05
        + in_v[unsafe_offset=y_up + x_right] * 0.05
        + in_v[unsafe_offset=y_down + x_left] * 0.05
        + in_v[unsafe_offset=y_down + x_right] * 0.05
        - v_val * 1.0
    )

    # Gray-Scott Reaction-Diffusion Equations
    var uvv = u_val * v_val * v_val
    var du_dt = Du_dev * lap_u - uvv + F_dev * (1.0 - u_val)
    var dv_dt = Dv_dev * lap_v + uvv - (F_dev + k_dev) * v_val

    var next_u_val = min(Float32(1.0), max(Float32(0.0), u_val + du_dt))
    var next_v_val = min(Float32(1.0), max(Float32(0.0), v_val + dv_dt))

    out_u[unsafe_offset=idx] = next_u_val
    out_v[unsafe_offset=idx] = next_v_val

    # Render RGBA Palette directly on GPU
    var diff = max(Float32(0.0), next_u_val - next_v_val)
    var r = UInt32(min(Float32(255.0), max(Float32(0.0), (1.0 - diff) * 255.0)))
    var g = UInt32(
        min(Float32(255.0), max(Float32(0.0), next_v_val * 2.5 * 255.0))
    )
    var b = UInt32(min(Float32(255.0), max(Float32(0.0), diff * 255.0)))
    var a: UInt32 = 255

    var rgba_val = r | (g << 8) | (b << 16) | (a << 24)
    out_pixels[unsafe_offset=idx] = Scalar[uint_dtype](rgba_val)


def main() raises:
    if getenv("SAVE_GIF") == "1":
        c.SetTraceLogLevel(7)

    init_window(
        SCREEN_W,
        SCREEN_H,
        "raylib [gpu] example - reaction-diffusion pde gpu kernel",
    )
    set_target_fps(60)

    var img = c.GenImageColor(GRID_W, GRID_H, BLACK())
    var tex = c.LoadTextureFromImage(img)
    c.UnloadImage(img)

    # Grid Buffers & Presets
    var Du: Float32 = 1.0
    var Dv: Float32 = 0.5
    var F: Float32 = 0.0545
    var k: Float32 = 0.062
    var preset_idx: Int = 0
    var flip: Bool = False

    comptime if not has_accelerator():
        print("No GPU accelerator detected on host system.")
        c.UnloadTexture(tex)
        close_window()
        return
    else:
        with DeviceContext() as ctx:
            var u_buf1 = ctx.enqueue_create_buffer[float_dtype](TOTAL_CELLS)
            var v_buf1 = ctx.enqueue_create_buffer[float_dtype](TOTAL_CELLS)
            var u_buf2 = ctx.enqueue_create_buffer[float_dtype](TOTAL_CELLS)
            var v_buf2 = ctx.enqueue_create_buffer[float_dtype](TOTAL_CELLS)
            var pix_buf = ctx.enqueue_create_buffer[uint_dtype](TOTAL_CELLS)

            # Initialize chemical concentrations: U = 1.0 everywhere, V = 1.0 in center square
            var mid_x = GRID_W // 2
            var mid_y = GRID_H // 2

            with u_buf1.map_to_host() as u_h, v_buf1.map_to_host() as v_h:
                for i in range(TOTAL_CELLS):
                    u_h[i] = 1.0
                    v_h[i] = 0.0

                for y in range(mid_y - 12, mid_y + 12):
                    for x in range(mid_x - 12, mid_x + 12):
                        var idx = y * GRID_W + x
                        v_h[idx] = 1.0

            var frame_count: Int = 0

            while not window_should_close():
                frame_count += 1

                if is_key_pressed(KEY_SPACE):
                    with u_buf1.map_to_host() as u_h, v_buf1.map_to_host() as v_h:
                        for i in range(TOTAL_CELLS):
                            u_h[i] = 1.0
                            v_h[i] = 0.0

                        for y in range(mid_y - 12, mid_y + 12):
                            for x in range(mid_x - 12, mid_x + 12):
                                var idx = y * GRID_W + x
                                v_h[idx] = 1.0

                if is_key_pressed(KEY_P):
                    preset_idx = (preset_idx + 1) % 3
                    if preset_idx == 0:
                        F = 0.0545
                        k = 0.062
                    elif preset_idx == 1:
                        F = 0.0367
                        k = 0.0649
                    else:
                        F = 0.030
                        k = 0.062

                    with u_buf1.map_to_host() as u_h, v_buf1.map_to_host() as v_h:
                        for i in range(TOTAL_CELLS):
                            u_h[i] = 1.0
                            v_h[i] = 0.0

                        for y in range(mid_y - 12, mid_y + 12):
                            for x in range(mid_x - 12, mid_x + 12):
                                var idx = y * GRID_W + x
                                v_h[idx] = 1.0

                if is_key_pressed(KEY_S):
                    take_screenshot("media/gpu_reaction_diffusion.png")

                # Mouse Injection
                if is_mouse_button_down(MOUSE_BUTTON_LEFT):
                    var mpos = get_mouse_position()
                    var gx = Int(mpos.x / 4.0)
                    var gy = Int(mpos.y / 4.0)

                    var cur_v = v_buf1 if not flip else v_buf2
                    with cur_v.map_to_host() as v_h:
                        for dy in range(-6, 7):
                            for dx in range(-6, 7):
                                var nx = gx + dx
                                var ny = gy + dy
                                if (
                                    nx >= 0
                                    and nx < GRID_W
                                    and ny >= 0
                                    and ny < GRID_H
                                ):
                                    v_h[ny * GRID_W + nx] = 1.0

                # Dispatch 4 GPU Sub-steps per frame
                for _sub in range(4):
                    var in_u = u_buf1 if not flip else u_buf2
                    var in_v = v_buf1 if not flip else v_buf2
                    var out_u = u_buf2 if not flip else u_buf1
                    var out_v = v_buf2 if not flip else v_buf1

                    ctx.enqueue_function[reaction_diffusion_gpu_kernel](
                        out_u,
                        out_v,
                        pix_buf,
                        in_u,
                        in_v,
                        Int32(GRID_W),
                        Int32(GRID_H),
                        Du,
                        Dv,
                        F,
                        k,
                        grid_dim=(GRID_X, GRID_Y),
                        block_dim=(BLOCK_X, BLOCK_Y),
                    )
                    flip = not flip

                ctx.synchronize()

                # Read back pixel buffer to Raylib Texture
                with pix_buf.map_to_host() as host_buf:
                    c.UpdateTexture(
                        tex, host_buf.unsafe_ptr().unsafe_bitcast[NoneType]()
                    )

                # Render Texture & UI Overlay
                begin_drawing()
                clear_background(BLACK())

                c.DrawTexturePro(
                    tex,
                    Rectangle(0.0, 0.0, Float32(GRID_W), Float32(GRID_H)),
                    Rectangle(0.0, 0.0, Float32(SCREEN_W), Float32(SCREEN_H)),
                    Vector2(0.0, 0.0),
                    0.0,
                    WHITE(),
                )

                # Light semi-transparent UI overlay for crisp text readability
                c.DrawRectangle(0, 0, SCREEN_W, 75, Color(245, 245, 245, 220))

                var title = "GRAY-SCOTT REACTION-DIFFUSION GPU KERNEL"
                var title_x = (SCREEN_W - measure_text(title, 20)) // 2
                draw_text(
                    title,
                    title_x,
                    14,
                    20,
                    BLACK(),
                )

                var subtitle = (
                    "MOUSE LEFT DRAG: Inject Chemical  |  SPACE: Reset  |  P:"
                    " Switch Preset"
                )
                var sub_x = (SCREEN_W - measure_text(subtitle, 16)) // 2
                draw_text(
                    subtitle,
                    sub_x,
                    44,
                    16,
                    BLACK(),
                )

                draw_fps(10, 12)
                end_drawing()

                if getenv("SAVE_GIF") == "1":
                    if frame_count <= 2400:
                        var frame_str = String(frame_count)
                        while frame_str.byte_length() < 6:
                            frame_str = "0" + frame_str
                        take_screenshot(
                            "/tmp/rd_frames/frame_" + frame_str + ".png"
                        )
                    else:
                        break

        c.UnloadTexture(tex)
        close_window()
        _ = flip

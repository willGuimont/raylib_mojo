"""Raylib [gpu/kernel] example - N-Body Gravitational Galaxy GPU Kernel.

Demonstrates genuine GPU kernel programming in Mojo using MAX DeviceContext & std.gpu.
Launches O(N^2) pairwise gravitational interaction GPU kernels across CUDA threads on NVIDIA GPU.
Controls:
  SPACE: Reset galaxy spiral formation
  G: Toggle super-gravity mode
"""

from std.sys import has_accelerator
from std.math import sin, cos, sqrt
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
    measure_text,
    draw_fps,
    draw_circle_v,
    take_screenshot,
    is_key_pressed,
    BLACK,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    GOLD,
    SKYBLUE,
    WHITE,
    ORANGE,
    PURPLE,
    Color,
    Vector2,
    KEY_SPACE,
    KEY_G,
    KEY_S,
)
import raylib.c as c

from layout import row_major, stack_allocation
from max.gpu.memory import AddressSpace
from max.gpu.sync import barrier

comptime SCREEN_W = 1000
comptime SCREEN_H = 600
comptime NUM_BODIES = 1600
comptime SOFTENING: Float32 = 40.0
comptime THREADS_PER_BLOCK = 128
comptime BLOCKS_PER_GRID = (
    NUM_BODIES + THREADS_PER_BLOCK - 1
) // THREADS_PER_BLOCK
comptime dtype = DType.float32


def nbody_gpu_kernel(
    out_px: Pointer[Scalar[dtype], MutAnyOrigin],
    out_py: Pointer[Scalar[dtype], MutAnyOrigin],
    out_vx: Pointer[Scalar[dtype], MutAnyOrigin],
    out_vy: Pointer[Scalar[dtype], MutAnyOrigin],
    in_px: Pointer[Scalar[dtype], MutAnyOrigin],
    in_py: Pointer[Scalar[dtype], MutAnyOrigin],
    in_vx: Pointer[Scalar[dtype], MutAnyOrigin],
    in_vy: Pointer[Scalar[dtype], MutAnyOrigin],
    in_mass: Pointer[Scalar[dtype], MutAnyOrigin],
    num_bodies_dev: Int32,
    gravity_scale_dev: Float32,
    dt_dev: Float32,
):
    var i = Int32(block_idx.x * block_dim.x + thread_idx.x)
    var tid = Int32(thread_idx.x)

    var p1_x: Float32 = 0.0
    var p1_y: Float32 = 0.0
    var v1_x: Float32 = 0.0
    var v1_y: Float32 = 0.0

    if i < num_bodies_dev:
        p1_x = in_px[unsafe_offset=i]
        p1_y = in_py[unsafe_offset=i]
        v1_x = in_vx[unsafe_offset=i]
        v1_y = in_vy[unsafe_offset=i]

    # Shared Memory Buffers
    var sh_px = stack_allocation[dtype, address_space=AddressSpace.SHARED](
        row_major[THREADS_PER_BLOCK]()
    )
    var sh_py = stack_allocation[dtype, address_space=AddressSpace.SHARED](
        row_major[THREADS_PER_BLOCK]()
    )
    var sh_m = stack_allocation[dtype, address_space=AddressSpace.SHARED](
        row_major[THREADS_PER_BLOCK]()
    )

    var ax: Float32 = 0.0
    var ay: Float32 = 0.0

    # Tiled Force Summation using Shared Memory
    var num_tiles = (
        num_bodies_dev + THREADS_PER_BLOCK - 1
    ) // THREADS_PER_BLOCK
    for tile in range(num_tiles):
        var tile_idx = tile * THREADS_PER_BLOCK + tid

        # Load into Shared Memory
        if tile_idx < num_bodies_dev:
            sh_px[tid] = in_px[unsafe_offset=tile_idx]
            sh_py[tid] = in_py[unsafe_offset=tile_idx]
            sh_m[tid] = in_mass[unsafe_offset=tile_idx]
        else:
            sh_m[tid] = 0.0

        barrier()

        # Compute forces against shared tile
        if i < num_bodies_dev:
            for j in range(THREADS_PER_BLOCK):
                var p2_m = sh_m[j]
                if p2_m > 0.0:
                    var p2_x = sh_px[j]
                    var p2_y = sh_py[j]
                    var dx = p2_x - p1_x
                    var dy = p2_y - p1_y
                    var dist_sq = dx * dx + dy * dy + SOFTENING
                    var dist = sqrt(dist_sq)

                    # F = m1 * a = G (m1 * m2) / r^2
                    # a = G * m2 / r^2
                    # To avoid to have to normalize the vector (dx, dy), we simply divide by r^3
                    # a = G * m2 / r^2 * (dx / r) = G * m2 / r^3 * dx
                    var force = (p2_m * gravity_scale_dev) / (dist_sq * dist)
                    ax += dx * force
                    ay += dy * force

        barrier()

    # Euler-Cromer Integration on GPU
    if i < num_bodies_dev:
        var nvx = v1_x + ax * dt_dev
        var nvy = v1_y + ay * dt_dev
        var npx = p1_x + nvx * dt_dev
        var npy = p1_y + nvy * dt_dev

        # Boundary reflections
        if npx < 0.0 or npx > 1000.0:
            nvx = -nvx * 0.8
        if npy < 0.0 or npy > 600.0:
            nvy = -nvy * 0.8

        out_vx[unsafe_offset=i] = nvx
        out_vy[unsafe_offset=i] = nvy
        out_px[unsafe_offset=i] = npx
        out_py[unsafe_offset=i] = npy


def body_color(speed: Float32) -> Color:
    if speed > 220.0:
        return WHITE()
    elif speed > 150.0:
        return SKYBLUE()
    elif speed > 90.0:
        return GOLD()
    elif speed > 40.0:
        return ORANGE()
    else:
        return RED()


def main() raises:
    if getenv("SAVE_GIF") == "1":
        c.SetTraceLogLevel(7)

    init_window(
        SCREEN_W,
        SCREEN_H,
        "raylib [gpu] example - n-body gravitational gpu kernel",
    )
    set_target_fps(60)

    var gravity_scale: Float32 = 1.0
    var dt: Float32 = 0.016

    comptime if not has_accelerator():
        print("No GPU accelerator detected on host system.")
        close_window()
        return
    else:
        with DeviceContext() as ctx:
            # Create GPU Buffers for N-Body Positions, Velocities, and Mass
            var px_buf1 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var py_buf1 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var vx_buf1 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var vy_buf1 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)

            var px_buf2 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var py_buf2 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var vx_buf2 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)
            var vy_buf2 = ctx.enqueue_create_buffer[dtype](NUM_BODIES)

            var mass_buf = ctx.enqueue_create_buffer[dtype](NUM_BODIES)

            var center_x = Float32(SCREEN_W / 2)
            var center_y = Float32(SCREEN_H / 2)

            with px_buf1.map_to_host() as px_h, py_buf1.map_to_host() as py_h, vx_buf1.map_to_host() as vx_h, vy_buf1.map_to_host() as vy_h, mass_buf.map_to_host() as m_h:
                px_h[0] = center_x
                py_h[0] = center_y
                vx_h[0] = 0.0
                vy_h[0] = 0.0
                m_h[0] = 50000.0

                for i in range(1, NUM_BODIES):
                    var arm = Float32(i % 3)
                    var dist = Float32(
                        20.0 + (Float32(i) / Float32(NUM_BODIES)) * 260.0
                    )
                    var angle = (
                        arm * 2.094395
                        + (dist * 0.03)
                        + (Float32(c.GetRandomValue(-10, 10)) * 0.01)
                    )

                    px_h[i] = center_x + cos(angle) * dist
                    py_h[i] = center_y + sin(angle) * dist

                    var orbit_speed = sqrt(Float32(1.0) * 50000.0 / dist) * 0.95
                    vx_h[i] = -sin(angle) * orbit_speed
                    vy_h[i] = cos(angle) * orbit_speed
                    m_h[i] = Float32(c.GetRandomValue(5, 20))

            var flip: Bool = False
            var frame_count: Int = 0

            while not window_should_close():
                frame_count += 1

                # Controls
                if is_key_pressed(KEY_SPACE):
                    with px_buf1.map_to_host() as px_h, py_buf1.map_to_host() as py_h, vx_buf1.map_to_host() as vx_h, vy_buf1.map_to_host() as vy_h, mass_buf.map_to_host() as m_h:
                        px_h[0] = center_x
                        py_h[0] = center_y
                        vx_h[0] = 0.0
                        vy_h[0] = 0.0
                        m_h[0] = 50000.0

                        for i in range(1, NUM_BODIES):
                            var arm = Float32(i % 3)
                            var dist = Float32(
                                20.0
                                + (Float32(i) / Float32(NUM_BODIES)) * 260.0
                            )
                            var angle = (
                                arm * 2.094395
                                + (dist * 0.03)
                                + (Float32(c.GetRandomValue(-10, 10)) * 0.01)
                            )

                            px_h[i] = center_x + cos(angle) * dist
                            py_h[i] = center_y + sin(angle) * dist

                            var orbit_speed = (
                                sqrt(Float32(1.0) * 50000.0 / dist) * 0.95
                            )
                            vx_h[i] = -sin(angle) * orbit_speed
                            vy_h[i] = cos(angle) * orbit_speed
                            m_h[i] = Float32(c.GetRandomValue(5, 20))

                if is_key_pressed(KEY_G):
                    gravity_scale = 3.0 if gravity_scale == 1.0 else 1.0

                if is_key_pressed(KEY_S):
                    take_screenshot("media/gpu_nbody.png")

                # Dispatch Mojo GPU Kernel to compute N^2 forces
                if not flip:
                    ctx.enqueue_function[nbody_gpu_kernel](
                        px_buf2,
                        py_buf2,
                        vx_buf2,
                        vy_buf2,
                        px_buf1,
                        py_buf1,
                        vx_buf1,
                        vy_buf1,
                        mass_buf,
                        Int32(NUM_BODIES),
                        gravity_scale,
                        dt,
                        grid_dim=BLOCKS_PER_GRID,
                        block_dim=THREADS_PER_BLOCK,
                    )
                else:
                    ctx.enqueue_function[nbody_gpu_kernel](
                        px_buf1,
                        py_buf1,
                        vx_buf1,
                        vy_buf1,
                        px_buf2,
                        py_buf2,
                        vx_buf2,
                        vy_buf2,
                        mass_buf,
                        Int32(NUM_BODIES),
                        gravity_scale,
                        dt,
                        grid_dim=BLOCKS_PER_GRID,
                        block_dim=THREADS_PER_BLOCK,
                    )

                ctx.synchronize()

                # Render GPU Body Positions
                var cur_px = px_buf2 if not flip else px_buf1
                var cur_py = py_buf2 if not flip else py_buf1
                var cur_vx = vx_buf2 if not flip else vx_buf1
                var cur_vy = vy_buf2 if not flip else vy_buf1

                begin_drawing()
                clear_background(BLACK())

                with cur_px.map_to_host() as px_h, cur_py.map_to_host() as py_h, cur_vx.map_to_host() as vx_h, cur_vy.map_to_host() as vy_h:
                    # Black Hole
                    draw_circle_v(Vector2(px_h[0], py_h[0]), 10.0, PURPLE())
                    draw_circle_v(Vector2(px_h[0], py_h[0]), 6.0, WHITE())

                    # Stars
                    for i in range(1, NUM_BODIES):
                        var vx_val = vx_h[i]
                        var vy_val = vy_h[i]
                        var speed = sqrt(vx_val * vx_val + vy_val * vy_val)
                        draw_circle_v(
                            Vector2(px_h[i], py_h[i]), 2.0, body_color(speed)
                        )

                # Light semi-transparent UI overlay for crisp text readability
                c.DrawRectangle(0, 0, SCREEN_W, 75, Color(245, 245, 245, 220))

                # UI Header & Controls (Dynamically Centered)
                var title = "N-BODY GRAVITATIONAL GALAXY GPU KERNEL"
                var title_x = (SCREEN_W - measure_text(title, 20)) // 2
                draw_text(title, title_x, 14, 20, BLACK())

                var inst = (
                    "SPACE: Reset Galaxy  |  G: Gravity Mult ("
                    + String(Int(gravity_scale))
                    + "x)"
                )
                var inst_x = (SCREEN_W - measure_text(inst, 16)) // 2
                draw_text(inst, inst_x, 44, 16, BLACK())

                draw_fps(10, 12)
                end_drawing()

                if getenv("SAVE_GIF") == "1":
                    if frame_count <= 2400:
                        var frame_str = String(frame_count)
                        while frame_str.byte_length() < 6:
                            frame_str = "0" + frame_str
                        take_screenshot(
                            "/tmp/nbody_frames/frame_" + frame_str + ".png"
                        )
                    else:
                        break

                flip = not flip

        close_window()

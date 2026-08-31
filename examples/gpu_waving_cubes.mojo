"""Raylib [gpu/kernel] example - 32k Waving Cubes GPU Kernel.

Demonstrates genuine GPU kernel programming in Mojo using MAX DeviceContext & std.gpu.
Launches 32,768 parallel GPU threads across CUDA blocks to evaluate 3D wave mechanics,
scatter displacement vectors, scale dynamics, and HSV color transformations per frame.

Controls:
  Mouse Left Drag: Orbit 3D Camera around waving grid
  R: Reset camera position
  S: Save screenshot to media/gpu_waving_cubes.png
"""

from std.sys import has_accelerator
from std.math import sin, cos, sqrt, abs
from std.memory import Pointer
from std.origin import MutAnyOrigin
from std.gpu import thread_idx, block_idx, block_dim, global_idx
from max.gpu.host import DeviceContext, DeviceBuffer
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
    draw_grid,
    begin_mode_3d,
    end_mode_3d,
    get_time,
    take_screenshot,
    is_key_pressed,
    is_mouse_button_down,
    get_mouse_delta,
    LIGHTGRAY,
    DARKGRAY,
    DARKBLUE,
    Color,
    Vector3,
    Camera3D,
    CAMERA_PERSPECTIVE,
    KEY_R,
    KEY_S,
    MOUSE_BUTTON_LEFT,
    c,
    rcamera,
)

comptime SCREEN_W = 1000
comptime SCREEN_H = 600
comptime NUM_BLOCKS = 32
comptime TOTAL_CUBES = NUM_BLOCKS * NUM_BLOCKS * NUM_BLOCKS  # 32,768 cubes
comptime THREADS_PER_BLOCK = 256
comptime BLOCKS_PER_GRID = (
    TOTAL_CUBES + THREADS_PER_BLOCK - 1
) // THREADS_PER_BLOCK
comptime dtype = DType.float32


def waving_cubes_gpu_kernel(
    out_px: Pointer[Scalar[dtype], MutAnyOrigin],
    out_py: Pointer[Scalar[dtype], MutAnyOrigin],
    out_pz: Pointer[Scalar[dtype], MutAnyOrigin],
    out_scale: Pointer[Scalar[dtype], MutAnyOrigin],
    out_cr: Pointer[Scalar[dtype], MutAnyOrigin],
    out_cg: Pointer[Scalar[dtype], MutAnyOrigin],
    out_cb: Pointer[Scalar[dtype], MutAnyOrigin],
    num_blocks_dev: Int32,
    total_cubes_dev: Int32,
    time_dev: Float32,
):
    var tid = global_idx.x

    if tid < Int(total_cubes_dev):
        var n = Int(num_blocks_dev)
        var x = tid % n
        var rem = tid // n
        var y = rem % n
        var z = rem // n

        var scale = (2.0 + sin(time_dev)) * 0.7
        var block_scale = Float32(x + y + z) / Float32(3 * n)
        var scatter = sin(block_scale * 20.0 + time_dev * 4.0)

        var half_n = Float32(n) / 2.0
        var cube_x = (Float32(x) - half_n) * (scale * 2.3) + scatter
        var cube_y = (Float32(y) - half_n) * (scale * 1.4) + scatter
        var cube_z = (Float32(z) - half_n) * (scale * 2.3) + scatter
        var cube_size = (2.1 - scale) * block_scale

        # HSV to RGB calculation on GPU
        var hue = Float32(((x + y + z) * 11) % 360) / 60.0
        var sat: Float32 = 0.85
        var val: Float32 = 0.95

        var c_val = val * sat
        var x_val = c_val * (1.0 - abs((hue % 2.0) - 1.0))
        var m_val = val - c_val

        var r: Float32 = 0.0
        var g: Float32 = 0.0
        var b: Float32 = 0.0

        if hue < 1.0:
            r = c_val
            g = x_val
        elif hue < 2.0:
            r = x_val
            g = c_val
        elif hue < 3.0:
            g = c_val
            b = x_val
        elif hue < 4.0:
            g = x_val
            b = c_val
        elif hue < 5.0:
            r = x_val
            b = c_val
        else:
            r = c_val
            b = x_val

        out_px[unsafe_offset=tid] = cube_x
        out_py[unsafe_offset=tid] = cube_y
        out_pz[unsafe_offset=tid] = cube_z
        out_scale[unsafe_offset=tid] = cube_size
        out_cr[unsafe_offset=tid] = (r + m_val) * 255.0
        out_cg[unsafe_offset=tid] = (g + m_val) * 255.0
        out_cb[unsafe_offset=tid] = (b + m_val) * 255.0


def main() raises:
    var is_saving_gif = getenv("SAVE_GIF") == "1"
    if is_saving_gif:
        c.SetTraceLogLevel(7)

    init_window(
        SCREEN_W,
        SCREEN_H,
        "Raylib Mojo - 32k Waving Cubes GPU Kernel Simulation",
    )
    set_target_fps(60)

    # Check GPU availability at compile time
    comptime if not has_accelerator():
        print("No GPU accelerator detected on host system.")
        close_window()
        return
    else:
        # Initialize GPU context & device buffers
        var ctx = DeviceContext()
        var dev_px = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_py = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_pz = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_scale = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_cr = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_cg = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)
        var dev_cb = ctx.enqueue_create_buffer[dtype](TOTAL_CUBES)

        var camera = Camera3D(
            position=Vector3(48.0, 38.0, 48.0),
            target=Vector3(0.0, 0.0, 0.0),
            up=Vector3(0.0, 1.0, 0.0),
            fovy=55.0,
            projection=CAMERA_PERSPECTIVE,
        )

        var frame_count: Int = 0

        while not window_should_close():
            frame_count += 1
            # Deterministic time sequence starting at 0.0 for seamless GIF looping
            var time: Float32 = Float32(
                frame_count - 1
            ) / 60.0 if is_saving_gif else Float32(get_time())

            # Camera Controls
            if is_mouse_button_down(MOUSE_BUTTON_LEFT):
                var mouse_delta = get_mouse_delta()
                rcamera.camera_yaw(camera, -mouse_delta.x * 0.003, True)
                rcamera.camera_pitch(
                    camera, -mouse_delta.y * 0.003, True, False, False
                )

            if is_key_pressed(KEY_R):
                camera.position = Vector3(48.0, 38.0, 48.0)
                camera.target = Vector3(0.0, 0.0, 0.0)

            if is_key_pressed(KEY_S):
                take_screenshot("media/gpu_waving_cubes.png")

            # Launch GPU Compute Kernel across 32,768 threads
            ctx.enqueue_function[waving_cubes_gpu_kernel](
                dev_px.unsafe_ptr(),
                dev_py.unsafe_ptr(),
                dev_pz.unsafe_ptr(),
                dev_scale.unsafe_ptr(),
                dev_cr.unsafe_ptr(),
                dev_cg.unsafe_ptr(),
                dev_cb.unsafe_ptr(),
                Int32(NUM_BLOCKS),
                Int32(TOTAL_CUBES),
                time,
                grid_dim=BLOCKS_PER_GRID,
                block_dim=THREADS_PER_BLOCK,
            )
            ctx.synchronize()

            begin_drawing()
            clear_background(LIGHTGRAY())

            begin_mode_3d(camera)
            draw_grid(22, 5.0)

            # Render evaluated 3D cubes
            with dev_px.map_to_host() as px_h, dev_py.map_to_host() as py_h, dev_pz.map_to_host() as pz_h, dev_scale.map_to_host() as sz_h, dev_cr.map_to_host() as cr_h, dev_cg.map_to_host() as cg_h, dev_cb.map_to_host() as cb_h:
                for i in range(TOTAL_CUBES):
                    var sz = sz_h[i]
                    if sz > 0.04:
                        var pos = Vector3(px_h[i], py_h[i], pz_h[i])
                        var col = Color(
                            UInt8(cr_h[i]),
                            UInt8(cg_h[i]),
                            UInt8(cb_h[i]),
                            255,
                        )
                        c.DrawCubeV(pos, Vector3(sz, sz, sz), col)

            end_mode_3d()

            draw_text(
                "32k Waving Cubes GPU Kernel Simulation",
                10,
                10,
                20,
                DARKBLUE(),
            )
            draw_text(
                "Left Drag: Orbit Camera | R: Reset | S: Screenshot",
                10,
                35,
                14,
                DARKGRAY(),
            )
            draw_fps(SCREEN_W - 100, 10)

            end_drawing()

            # Record exactly 376 frames (2*pi seconds) sampled every 3 frames for a 125-frame perfect loop
            if is_saving_gif:
                if frame_count <= 375:
                    if (frame_count - 1) % 3 == 0:
                        var frame_str = String(frame_count)
                        while frame_str.byte_length() < 6:
                            frame_str = "0" + frame_str
                        var path_str = (
                            "media/gpu_waving_cubes_frames/frame_"
                            + frame_str
                            + ".png"
                        )
                        take_screenshot(path_str)
                else:
                    break

        close_window()

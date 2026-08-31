"""Raylib [gpu/kernel] example - Interactive Mandelbrot & Julia Fractal GPU Kernel.

Demonstrates genuine GPU kernel programming in Mojo using MAX DeviceContext & std.gpu.
Launches 480,000 parallel GPU threads across 2D CUDA blocks on NVIDIA GPU.
Controls:
  Mouse Wheel: Zoom in / Zoom out at cursor
  Mouse Left Drag: Pan around fractal
  J: Toggle Mandelbrot <-> Julia set mode
  R: Reset view & parameters
  UP / DOWN: Change max iterations (64..2048)
"""

from std.sys import has_accelerator
from std.math import sin, cos, min, max
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
    take_screenshot,
    is_key_pressed,
    is_key_down,
    is_mouse_button_down,
    get_mouse_position,
    get_mouse_wheel_move,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    WHITE,
    BLACK,
    Color,
    Rectangle,
    Vector2,
    KEY_J,
    KEY_R,
    KEY_S,
    KEY_UP,
    KEY_DOWN,
    MOUSE_BUTTON_LEFT,
)
import raylib.c as c

comptime SCREEN_W = 800
comptime SCREEN_H = 600
comptime BLOCK_X = 16
comptime BLOCK_Y = 16
comptime GRID_X = (SCREEN_W + BLOCK_X - 1) // BLOCK_X
comptime GRID_Y = (SCREEN_H + BLOCK_Y - 1) // BLOCK_Y
comptime TOTAL_PIXELS = SCREEN_W * SCREEN_H
comptime dtype = DType.uint32


def mandelbrot_gpu_kernel(
    output: Pointer[Scalar[dtype], MutAnyOrigin],
    width_dev: Int32,
    height_dev: Int32,
    center_x_dev: Float64,
    center_y_dev: Float64,
    zoom_dev: Float64,
    max_iter_dev: Int32,
    is_julia_dev: Int32,
):
    var px = Int(block_idx.x * block_dim.x + thread_idx.x)
    var py = Int(block_idx.y * block_dim.y + thread_idx.y)
    var W = Int(width_dev)
    var H = Int(height_dev)

    if px >= W or py >= H:
        return

    var zoom = zoom_dev
    var max_iter = Int(max_iter_dev)

    var scale_x = 3.0 / (Float64(W) * zoom)
    var scale_y = 2.25 / (Float64(H) * zoom)

    var cx_val = center_x_dev + (Float64(px) - Float64(W // 2)) * scale_x
    var cy_val = center_y_dev + (Float64(py) - Float64(H // 2)) * scale_y

    var zx: Float64
    var zy: Float64
    var c_re: Float64
    var c_im: Float64

    if is_julia_dev == 1:
        zx = cx_val
        zy = cy_val
        c_re = -0.7
        c_im = 0.27015
    else:
        zx = 0.0
        zy = 0.0
        c_re = cx_val
        c_im = cy_val

    var iters: Int = 0
    while zx * zx + zy * zy <= 4.0 and iters < max_iter:
        var next_zx = zx * zx - zy * zy + c_re
        zy = 2.0 * zx * zy + c_im
        zx = next_zx
        iters += 1

    # RGBA Packing into 32-bit uint32
    var r: UInt32 = 0
    var g: UInt32 = 0
    var b: UInt32 = 0
    var a: UInt32 = 255

    if iters < max_iter:
        var t = Float32(iters) / Float32(max_iter)
        r = UInt32(sin(t * 6.28 + 0.0) * 127.0 + 128.0)
        g = UInt32(sin(t * 6.28 + 2.0) * 127.0 + 128.0)
        b = UInt32(sin(t * 6.28 + 4.0) * 127.0 + 128.0)

    # Little-endian RGBA: R | (G << 8) | (B << 16) | (A << 24)
    var rgba_val = r | (g << 8) | (b << 16) | (a << 24)
    output[unsafe_offset=py * W + px] = Scalar[dtype](rgba_val)


def main() raises:
    init_window(
        SCREEN_W,
        SCREEN_H,
        "mandelbrot & julia gpu kernel",
    )
    set_target_fps(60)

    var img = c.GenImageColor(SCREEN_W, SCREEN_H, BLACK())
    var tex = c.LoadTextureFromImage(img)
    c.UnloadImage(img)

    # View Parameters (Float64 precision)
    var center_x: Float64 = -0.5
    var center_y: Float64 = 0.0
    var zoom: Float64 = 1.0
    var max_iter: Int32 = 128
    var is_julia: Int32 = 0
    var prev_mouse_pos = Vector2()
    var frame_count: Int = 0

    # Check GPU availability at compile time
    comptime if not has_accelerator():
        print("No GPU accelerator detected on host system.")
        c.UnloadTexture(tex)
        close_window()
        return
    else:
        # Initialize MAX GPU DeviceContext & VRAM Buffer
        with DeviceContext() as ctx:
            var out_buf = ctx.enqueue_create_buffer[dtype](TOTAL_PIXELS)

            while not window_should_close():
                frame_count += 1

                # Handle Controls
                if is_key_pressed(KEY_J):
                    is_julia = 1 if is_julia == 0 else 0

                if is_key_pressed(KEY_S):
                    take_screenshot("media/gpu_mandelbrot.png")

                if is_key_pressed(KEY_R):
                    center_x = -0.5
                    center_y = 0.0
                    zoom = 1.0
                    max_iter = 128
                    is_julia = 0

                if is_key_down(KEY_UP):
                    max_iter = min(Int32(2048), max_iter + 8)
                if is_key_down(KEY_DOWN):
                    max_iter = max(Int32(32), max_iter - 8)

                # Mouse Zoom
                var wheel = get_mouse_wheel_move()
                if wheel != 0.0:
                    var zoom_factor: Float64 = 1.25 if wheel > 0.0 else 0.8
                    zoom *= zoom_factor

                # Mouse Drag Pan
                var mouse_pos = get_mouse_position()
                if is_mouse_button_down(MOUSE_BUTTON_LEFT):
                    var dx = Float64(mouse_pos.x - prev_mouse_pos.x)
                    var dy = Float64(mouse_pos.y - prev_mouse_pos.y)
                    center_x -= dx * (3.0 / (Float64(SCREEN_W) * zoom))
                    center_y -= dy * (2.25 / (Float64(SCREEN_H) * zoom))
                prev_mouse_pos = mouse_pos

                # Dispatch Mojo GPU Kernel onto GPU
                ctx.enqueue_function[mandelbrot_gpu_kernel](
                    out_buf,
                    Int32(SCREEN_W),
                    Int32(SCREEN_H),
                    center_x,
                    center_y,
                    zoom,
                    max_iter,
                    is_julia,
                    grid_dim=(GRID_X, GRID_Y),
                    block_dim=(BLOCK_X, BLOCK_Y),
                )
                ctx.synchronize()

                # Read back GPU buffer to Raylib Texture
                with out_buf.map_to_host() as host_buf:
                    c.UpdateTexture(
                        tex, host_buf.unsafe_ptr().unsafe_bitcast[NoneType]()
                    )

                # Render Texture & UI Header
                begin_drawing()
                clear_background(BLACK())

                c.DrawTexture(tex, 0, 0, WHITE())

                # Light semi-transparent UI overlay for crisp BLACK text readability
                c.DrawRectangle(0, 0, SCREEN_W, 75, Color(245, 245, 245, 220))

                var mode_title = (
                    "JULIA FRACTAL GPU KERNEL (Float64)" if is_julia
                    == 1 else "MANDELBROT FRACTAL GPU KERNEL (Float64)"
                )
                var title_x = (SCREEN_W - measure_text(mode_title, 20)) // 2
                draw_text(mode_title, title_x, 14, 20, BLACK())

                var inst = (
                    "WHEEL: Zoom  |  LEFT DRAG: Pan  |  J: Mode  |  R: Reset  |"
                    "  UP/DOWN: Iter ("
                    + String(max_iter)
                    + ")"
                )
                var inst_x = (SCREEN_W - measure_text(inst, 16)) // 2
                draw_text(inst, inst_x, 44, 16, BLACK())

                draw_fps(10, 12)
                end_drawing()

                if frame_count >= 10 and getenv("SAVE_SCREENSHOT") == "1":
                    take_screenshot("media/gpu_mandelbrot.png")
                    break

        c.UnloadTexture(tex)
        close_window()

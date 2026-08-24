"""Raylib [shaders] example - Conway's Game of Life Simulation.

Demonstrates cellular automata and render target texture processing (RenderTexture)
in Mojo.
Controls:
  SPACE: Pause / Resume simulation
  R: Reset grid with random live cells
  C: Clear grid
  Mouse Left Click: Draw / Toggle live cells
"""

from std.collections import List
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
    GREEN,
    Color,
    Rectangle,
    Vector2,
    KEY_SPACE,
    KEY_R,
    KEY_C,
    MOUSE_BUTTON_LEFT,
)
import raylib.c as c

comptime SCREEN_W = 800
comptime SCREEN_H = 600
comptime GRID_W = 160
comptime GRID_H = 120
comptime CELL_SIZE = 5 # 160x5 = 800, 120x5 = 600

def main():
    init_window(SCREEN_W, SCREEN_H, "raylib [shaders] example - game of life")
    set_target_fps(60)

    var grid = List[UInt8]()
    var next_grid = List[UInt8]()
    var total_cells = GRID_W * GRID_H

    for _ in range(total_cells):
        grid.append(0)
        next_grid.append(0)

    # Seed random cells
    for y in range(GRID_H):
        for x in range(GRID_W):
            if c.GetRandomValue(0, 100) < 20:
                grid[y * GRID_W + x] = 1

    # Create pixel buffer for dynamic texture rendering (160x120 RGBA)
    var img = c.GenImageColor(GRID_W, GRID_H, BLACK())
    var tex = c.LoadTextureFromImage(img)
    c.UnloadImage(img)

    var pixels = List[Color]()
    for _ in range(total_cells):
        pixels.append(BLACK())

    var is_paused: Bool = False
    var update_timer: Int32 = 0

    while not window_should_close():
        # Handle Input Controls
        if is_key_pressed(KEY_SPACE):
            is_paused = not is_paused

        if is_key_pressed(KEY_R):
            for y in range(GRID_H):
                for x in range(GRID_W):
                    grid[y * GRID_W + x] = 1 if (c.GetRandomValue(0, 100) < 25) else 0

        if is_key_pressed(KEY_C):
            for i in range(total_cells):
                grid[i] = 0

        # Mouse drawing
        if is_mouse_button_down(MOUSE_BUTTON_LEFT):
            var mpos = get_mouse_position()
            var gx = Int(mpos.x) / CELL_SIZE
            var gy = Int(mpos.y) / CELL_SIZE
            if gx >= 0 and gx < GRID_W and gy >= 0 and gy < GRID_H:
                grid[gy * GRID_W + gx] = 1

        # Cellular Automata Update (Conway's Rules)
        if not is_paused:
            update_timer += 1
            if update_timer >= 2: # Update every 2 frames for smooth visual speed
                update_timer = 0
                for y in range(GRID_H):
                    for x in range(GRID_W):
                        var neighbors: Int = 0
                        for dy in range(-1, 2):
                            for dx in range(-1, 2):
                                if dx == 0 and dy == 0:
                                    continue
                                var nx = (x + dx + GRID_W) % GRID_W
                                var ny = (y + dy + GRID_H) % GRID_H
                                if Int(grid[ny * GRID_W + nx]) == 1:
                                    neighbors += 1

                        var idx = y * GRID_W + x
                        var current_state = Int(grid[idx])
                        if current_state == 1:
                            next_grid[idx] = 1 if (neighbors == 2 or neighbors == 3) else 0
                        else:
                            next_grid[idx] = 1 if (neighbors == 3) else 0

                # Swap grids
                for i in range(total_cells):
                    grid[i] = next_grid[i]

        # Update pixel texture
        for y in range(GRID_H):
            for x in range(GRID_W):
                var idx = y * GRID_W + x
                if Int(grid[idx]) == 1:
                    pixels[idx] = GREEN()
                else:
                    pixels[idx] = BLACK()

        c.UpdateTexture(tex, pixels.unsafe_ptr().unsafe_bitcast[NoneType]())

        # Render Texture & UI Overlay
        begin_drawing()
        clear_background(BLACK())

        # Render scaled simulation texture across the window (160x120 scaled x5 to 800x600)
        c.DrawTexturePro(
            tex,
            Rectangle(0.0, 0.0, Float32(GRID_W), Float32(GRID_H)),
            Rectangle(0.0, 0.0, Float32(SCREEN_W), Float32(SCREEN_H)),
            Vector2(0.0, 0.0),
            0.0,
            WHITE()
        )

        # UI Info Overlay
        draw_text("CONWAY'S GAME OF LIFE", 280, 20, 20, RAYWHITE())
        draw_text("SPACE: Pause/Play  |  R: Randomize  |  C: Clear  |  Mouse Left: Draw", 160, 50, 16, RAYWHITE())

        if is_paused:
            draw_text("PAUSED", 360, 280, 26, RED())

        draw_fps(10, 10)
        end_drawing()

    c.UnloadTexture(tex)
    close_window()

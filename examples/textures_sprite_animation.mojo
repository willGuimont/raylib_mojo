"""Raylib [textures] example - Sprite Animation.

Demonstrates animated 2D sprite rendering using texture sub-rectangle clipping
(Rectangle) and frame timer control.
Controls:
  SPACE: Pause / Resume animation
  UP / DOWN: Change playback speed (FPS)
"""

from std.memory import Pointer
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
    is_key_down,
    RAYWHITE,
    WHITE,
    DARKGRAY,
    RED,
    BLUE,
    MAROON,
    GOLD,
    LIME,
    SKYBLUE,
    PURPLE,
    Color,
    Rectangle,
    Vector2,
    KEY_SPACE,
    KEY_UP,
    KEY_DOWN,
)
import raylib.c as c

comptime SCREEN_W = 800
comptime SCREEN_H = 450
comptime NUM_FRAMES = 8


def main():
    init_window(
        SCREEN_W, SCREEN_H, "raylib [textures] example - sprite animation"
    )
    set_target_fps(60)

    # Create a procedural 8-frame animated sprite sheet image (64x64 per frame -> 512x64 image)
    var img = c.GenImageColor(512, 64, RAYWHITE())
    var colors = List[Color]()
    colors.append(RED())
    colors.append(GOLD())
    colors.append(LIME())
    colors.append(SKYBLUE())
    colors.append(BLUE())
    colors.append(PURPLE())
    colors.append(MAROON())
    colors.append(DARKGRAY())

    var img_ptr = Pointer(to=img)
    for f in range(NUM_FRAMES):
        var col = colors[f]
        var start_x = f * 64
        # Draw frame background
        c.ImageDrawRectangle(img_ptr, Int32(start_x + 4), 4, 56, 56, col)
        # Draw inner frame pattern
        c.ImageDrawCircle(
            img_ptr, Int32(start_x + 32), 32, Int32(10 + f * 2), RAYWHITE()
        )

    var sprite_texture = c.LoadTextureFromImage(img)
    c.UnloadImage(img)

    var current_frame: Int32 = 0
    var frames_counter: Int32 = 0
    var anim_fps: Int32 = 12
    var is_paused: Bool = False

    while not window_should_close():
        # Handle User Input
        if is_key_pressed(KEY_SPACE):
            is_paused = not is_paused

        if is_key_down(KEY_UP):
            anim_fps += 1
            if anim_fps > 60:
                anim_fps = 60
        if is_key_down(KEY_DOWN):
            anim_fps -= 1
            if anim_fps < 1:
                anim_fps = 1

        # Update Frame Counter
        if not is_paused:
            frames_counter += 1
            if frames_counter >= (60 / anim_fps):
                frames_counter = 0
                current_frame += 1
                if current_frame >= NUM_FRAMES:
                    current_frame = 0

        # Sprite Source Rectangle clipping current frame
        var frame_width = Float32(sprite_texture.width) / Float32(NUM_FRAMES)
        var frame_height = Float32(sprite_texture.height)
        var frame_rec = Rectangle(
            Float32(current_frame) * frame_width, 0.0, frame_width, frame_height
        )

        # Position to draw sprite (centered on screen, scaled x3)
        var scale: Float32 = 3.0
        var position = Vector2(
            Float32(SCREEN_W / 2) - (frame_width * scale / 2.0),
            Float32(SCREEN_H / 2) - (frame_height * scale / 2.0),
        )

        begin_drawing()
        clear_background(RAYWHITE())

        draw_text("2D SPRITE SHEET ANIMATION", 240, 40, 20, DARKGRAY())
        draw_text("PRESS SPACE TO PAUSE / RESUME", 250, 80, 16, DARKGRAY())
        draw_text(
            "PRESS UP/DOWN TO CHANGE ANIMATION SPEED", 200, 105, 16, DARKGRAY()
        )

        # Render full sprite sheet preview at bottom
        draw_text("Sprite Sheet Source (8 Frames):", 100, 320, 16, DARKGRAY())
        c.DrawTexture(sprite_texture, 140, 350, WHITE())
        c.DrawRectangleLines(
            Int32(140 + Int(Float32(current_frame) * frame_width)),
            350,
            Int32(frame_width),
            Int32(frame_height),
            RED(),
        )

        # Render scaled current animated frame
        c.DrawTexturePro(
            sprite_texture,
            frame_rec,
            Rectangle(
                position.x,
                position.y,
                frame_width * scale,
                frame_height * scale,
            ),
            Vector2(0.0, 0.0),
            0.0,
            WHITE(),
        )

        draw_text(
            "Frame: "
            + String(Int(current_frame + 1))
            + " / "
            + String(NUM_FRAMES),
            350,
            270,
            18,
            DARKGRAY(),
        )
        draw_text(
            "Speed: " + String(Int(anim_fps)) + " FPS",
            350,
            290,
            18,
            RED() if is_paused else BLUE(),
        )

        if is_paused:
            draw_text("PAUSED", 360, 210, 24, RED())

        draw_fps(10, 10)
        end_drawing()

    c.UnloadTexture(sprite_texture)
    close_window()

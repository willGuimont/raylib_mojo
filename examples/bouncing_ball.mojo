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
    draw_circle_v,
    draw_rectangle,
    get_screen_width,
    get_screen_height,
    is_key_pressed,
    KEY_SPACE,
    Vector2,
    raymath,
    RAYWHITE,
    LIGHTGRAY,
    DARKGRAY,
    RED,
    BLUE,
    GREEN,
    ORANGE,
    MAROON,
)


def main():
    var width: Int32 = 800
    var height: Int32 = 450

    init_window(width, height, "Raylib Mojo - Bouncing Ball 2D Example")
    set_target_fps(60)

    var ball_position = Vector2(400.0, 225.0)
    var ball_speed = Vector2(5.0, 4.0)
    var ball_radius: Float32 = 20.0

    var frame_count = 0

    while not window_should_close():
        ball_position += ball_speed

        if (ball_position.x >= Float32(width) - ball_radius) or (
            ball_position.x <= ball_radius
        ):
            ball_speed.x *= -1.0

        if (ball_position.y >= Float32(height) - ball_radius) or (
            ball_position.y <= ball_radius
        ):
            ball_speed.y *= -1.0

        begin_drawing()
        clear_background(RAYWHITE())
        draw_rectangle(0, 0, width, height, LIGHTGRAY())
        draw_circle_v(
            ball_position,
            ball_radius,
            MAROON() if (frame_count // 30) % 2 == 0 else BLUE(),
        )
        draw_text("Bouncing Ball Simulation", 20, 20, 24, DARKGRAY())
        draw_text("Mojo + Raylib FFI", 20, 50, 18, DARKGRAY())
        draw_fps(width - 100, 10)
        end_drawing()

        frame_count += 1

    close_window()
    print("Bouncing ball example closed.")

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
    begin_mode_3d,
    end_mode_3d,
    draw_cube,
    draw_cube_wires,
    draw_sphere,
    draw_grid,
    Vector3,
    Camera3D,
    CAMERA_PERSPECTIVE,
    rcamera,
    RAYWHITE,
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

    init_window(width, height, "Raylib Mojo - 3D Camera & Shapes Example")
    set_target_fps(60)

    var camera = Camera3D(
        position=Vector3(0.0, 10.0, 10.0),
        target=Vector3(0.0, 0.0, 0.0),
        up=Vector3(0.0, 1.0, 0.0),
        fovy=45.0,
        projection=CAMERA_PERSPECTIVE,
    )

    while not window_should_close():
        rcamera.camera_yaw(camera, 0.005, True)
        begin_drawing()
        clear_background(RAYWHITE())

        begin_mode_3d(camera)
        draw_cube(Vector3(-2.0, 1.0, 0.0), 2.0, 2.0, 2.0, RED())
        draw_cube_wires(Vector3(-2.0, 1.0, 0.0), 2.0, 2.0, 2.0, MAROON())
        draw_sphere(Vector3(2.0, 1.0, 0.0), 1.5, BLUE())
        draw_cube_wires(Vector3(2.0, 1.0, 0.0), 3.0, 3.0, 3.0, DARKGRAY())
        draw_grid(10, 1.0)
        end_mode_3d()

        draw_text("Welcome to 3D Graphics in Mojo!", 10, 40, 20, DARKGRAY())
        draw_fps(10, 10)
        end_drawing()

    close_window()
    print("3D example closed.")

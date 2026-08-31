from raylib import (
    init_window,
    window_should_close,
    close_window,
    set_target_fps,
    begin_drawing,
    end_drawing,
    clear_background,
    begin_mode_3d,
    end_mode_3d,
    draw_cube,
    draw_cube_wires,
    draw_grid,
    draw_fps,
    get_time,
    Vector3,
    Camera3D,
    CAMERA_PERSPECTIVE,
    LIGHTGRAY,
    DARKGRAY,
    c,
)
from std.math import sin, cos


def main():
    var screenWidth: Int32 = 800
    var screenHeight: Int32 = 450

    init_window(
        screenWidth, screenHeight, "raylib [models] example - waving cubes"
    )

    var camera = Camera3D(
        position=Vector3(30.0, 20.0, 30.0),
        target=Vector3(0.0, 0.0, 0.0),
        up=Vector3(0.0, 1.0, 0.0),
        fovy=70.0,
        projection=CAMERA_PERSPECTIVE,
    )

    var numBlocks: Int = 15

    set_target_fps(60)

    while not window_should_close():
        var time = Float32(get_time())
        var scale = (2.0 + sin(time)) * 0.7

        var cameraTime = time * 0.3
        camera.position.x = cos(cameraTime) * 40.0
        camera.position.z = sin(cameraTime) * 40.0

        begin_drawing()
        clear_background(LIGHTGRAY())

        begin_mode_3d(camera)
        draw_grid(10, 5.0)

        for x in range(numBlocks):
            for y in range(numBlocks):
                for z in range(numBlocks):
                    var blockScale = Float32(x + y + z) / 30.0
                    var scatter = sin(blockScale * 20.0 + time * 4.0)

                    var cubePos = Vector3(
                        (Float32(x) - Float32(numBlocks) / 2.0) * (scale * 3.0)
                        + scatter,
                        (Float32(y) - Float32(numBlocks) / 2.0) * (scale * 2.0)
                        + scatter,
                        (Float32(z) - Float32(numBlocks) / 2.0) * (scale * 3.0)
                        + scatter,
                    )

                    var hue = Float32(((x + y + z) * 18) % 360)
                    var cubeColor = c.ColorFromHSV(hue, 0.75, 0.9)
                    var cubeSize = (2.4 - scale) * blockScale

                    draw_cube(cubePos, cubeSize, cubeSize, cubeSize, cubeColor)
                    draw_cube_wires(
                        cubePos, cubeSize, cubeSize, cubeSize, DARKGRAY()
                    )

        end_mode_3d()

        draw_fps(10, 10)
        end_drawing()

    close_window()

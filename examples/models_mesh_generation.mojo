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
    draw_grid,
    draw_rectangle,
    draw_rectangle_lines,
    draw_text,
    Vector3,
    Camera3D,
    Mesh,
    Model,
    Image,
    CAMERA_PERSPECTIVE,
    LIGHTGRAY,
    DARKBLUE,
    DARKGRAY,
    BLUE,
    WHITE,
    RED,
    GREEN,
    MOUSE_BUTTON_LEFT,
    rcamera,
    c,
)


def main():
    var screenWidth: Int32 = 800
    var screenHeight: Int32 = 450

    init_window(
        screenWidth,
        screenHeight,
        "raylib [models] example - procedural mesh generation",
    )

    # Generate a checked image & texture using OOP methods
    var checked = Image.gen_checked(2, 2, 1, 1, RED(), GREEN())
    var texture = checked.to_texture()
    checked.unload()

    # Generate 7 procedural models directly from Mesh static factories & .to_model()
    var model_plane = Mesh.gen_plane(2.0, 2.0, 4, 3).to_model()
    var model_cube = Mesh.gen_cube(2.0, 1.0, 2.0).to_model()
    var model_sphere = Mesh.gen_sphere(2.0, 32, 32).to_model()
    var model_cylinder = Mesh.gen_cylinder(1.0, 2.0, 16).to_model()
    var model_torus = Mesh.gen_torus(0.25, 4.0, 16, 32).to_model()
    var model_knot = Mesh.gen_knot(1.0, 2.0, 16, 128).to_model()
    var model_poly = Mesh.gen_poly(5, 2.0).to_model()

    # Apply diffuse texture via model.set_texture(...)
    model_plane.set_texture(texture)
    model_cube.set_texture(texture)
    model_sphere.set_texture(texture)
    model_cylinder.set_texture(texture)
    model_torus.set_texture(texture)
    model_knot.set_texture(texture)
    model_poly.set_texture(texture)

    var camera = Camera3D(
        position=Vector3(5.0, 5.0, 5.0),
        target=Vector3(0.0, 0.0, 0.0),
        up=Vector3(0.0, 1.0, 0.0),
        fovy=45.0,
        projection=CAMERA_PERSPECTIVE,
    )

    var position = Vector3(0.0, 0.0, 0.0)
    var currentModel: Int32 = 0
    var numModels: Int32 = 7

    set_target_fps(60)

    while not window_should_close():
        rcamera.camera_yaw(camera, 0.005, True)

        if c.IsMouseButtonPressed(MOUSE_BUTTON_LEFT):
            currentModel = (currentModel + 1) % numModels

        begin_drawing()
        clear_background(LIGHTGRAY())

        begin_mode_3d(camera)

        if currentModel == 0:
            model_plane.draw(position, 1.0, WHITE())
            model_plane.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 1:
            model_cube.draw(position, 1.0, WHITE())
            model_cube.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 2:
            model_sphere.draw(position, 1.0, WHITE())
            model_sphere.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 3:
            model_cylinder.draw(position, 1.0, WHITE())
            model_cylinder.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 4:
            model_torus.draw(position, 1.0, WHITE())
            model_torus.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 5:
            model_knot.draw(position, 1.0, WHITE())
            model_knot.draw_wires(position, 1.0, DARKGRAY())
        elif currentModel == 6:
            model_poly.draw(position, 1.0, WHITE())
            model_poly.draw_wires(position, 1.0, DARKGRAY())

        draw_grid(10, 1.0)
        end_mode_3d()

        draw_rectangle(30, 400, 310, 30, WHITE())
        draw_rectangle_lines(30, 400, 310, 30, DARKBLUE())
        draw_text("CLICK MOUSE to CYCLE PROCEDURAL MODELS", 40, 410, 10, BLUE())

        if currentModel == 0:
            draw_text("PLANE", 680, 10, 20, DARKBLUE())
        elif currentModel == 1:
            draw_text("CUBE", 680, 10, 20, DARKBLUE())
        elif currentModel == 2:
            draw_text("SPHERE", 680, 10, 20, DARKBLUE())
        elif currentModel == 3:
            draw_text("CYLINDER", 680, 10, 20, DARKBLUE())
        elif currentModel == 4:
            draw_text("TORUS", 680, 10, 20, DARKBLUE())
        elif currentModel == 5:
            draw_text("KNOT", 680, 10, 20, DARKBLUE())
        elif currentModel == 6:
            draw_text("POLY", 680, 10, 20, DARKBLUE())

        end_drawing()

    texture.unload()
    model_plane.unload()
    model_cube.unload()
    model_sphere.unload()
    model_cylinder.unload()
    model_torus.unload()
    model_knot.unload()
    model_poly.unload()

    close_window()

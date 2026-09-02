"""Simple Raygui example in Mojo demonstrating basic controls and interactive canvas."""

from std.math import cos, sin
from raylib import (
    init_window,
    window_should_close,
    close_window,
    set_target_fps,
    begin_drawing,
    end_drawing,
    clear_background,
    draw_fps,
    draw_circle,
    draw_rectangle,
    Rectangle,
    Vector2,
    Color,
    WHITE,
    RAYWHITE,
    DARKGRAY,
    RED,
    GREEN,
    BLUE,
    GOLD,
)
from raylib.gui import (
    Gui,
    GuiCheckBox,
    GuiSlider,
    GuiSpinner,
    GuiToggleGroup,
    GuiComboBox,
)
import raylib.c as c


def main():
    var screen_width: Int32 = 800
    var screen_height: Int32 = 500

    init_window(
        screen_width, screen_height, "raylib + raygui - simple gui controls"
    )
    set_target_fps(60)

    # Stateful widget wrappers with proper label spacing inside panel
    var chk_anim = GuiCheckBox(Rectangle(30, 70, 20, 20), "Animate Shape", True)
    # Position slider at x=90 so textLeft ("Speed") fits inside x=25..85 inside panel
    var slider_speed = GuiSlider(
        Rectangle(90, 110, 115, 20), "Speed", "1.0x", 0.5, 0.1, 2.0
    )
    # Position spinner at x=90 so text ("Radius") fits inside x=25..85 inside panel
    var spinner_size = GuiSpinner(
        Rectangle(90, 150, 115, 24), "Radius", 40, 10, 100, False
    )
    var toggle_shape = GuiToggleGroup(
        Rectangle(30, 210, 70, 28), "Circle;Square;Triangle", 0
    )
    var combo_color = GuiComboBox(
        Rectangle(30, 270, 200, 28), "Red;Green;Blue;Gold", 0
    )

    var button_clicks: Int32 = 0
    var status_text = String("Ready")
    var rotation: Float32 = 0.0
    var rad_conv: Float32 = 0.017453292519943295

    while not window_should_close():
        # Animation update
        if chk_anim.checked:
            rotation += slider_speed.value * 3.0
            if rotation >= 360.0:
                rotation -= 360.0

        begin_drawing()
        clear_background(RAYWHITE())
        # Draw explicit opaque background rectangle to prevent terminal text bleed-through
        draw_rectangle(0, 0, screen_width, screen_height, RAYWHITE())

        # Left Control Panel
        _ = Gui.group_box(Rectangle(15, 30, 250, 420), "Control Panel")

        _ = chk_anim.draw()
        _ = slider_speed.draw()
        _ = spinner_size.draw()

        _ = Gui.label(Rectangle(30, 190, 200, 20), "Select Shape:")
        _ = toggle_shape.draw()

        _ = Gui.label(Rectangle(30, 250, 200, 20), "Preset Color:")

        # Action Button
        if Gui.button(Rectangle(30, 320, 200, 32), "Action Button"):
            button_clicks += 1
            status_text = "Button clicked " + String(button_clicks) + " times!"

        _ = Gui.label(
            Rectangle(30, 365, 200, 20), "Clicks: " + String(button_clicks)
        )

        # Right Canvas Preview Panel
        _ = Gui.group_box(Rectangle(280, 30, 505, 420), "Visual Output")

        # Color preset selection
        var active_color = RED()
        if combo_color.active == 1:
            active_color = GREEN()
        elif combo_color.active == 2:
            active_color = BLUE()
        elif combo_color.active == 3:
            active_color = GOLD()

        var center_x: Int32 = 532
        var center_y: Int32 = 240
        var radius = Float32(spinner_size.value)

        # Draw animated shape based on toggle selection
        if toggle_shape.active == 0:
            # Circle with orbiting white dot
            draw_circle(center_x, center_y, radius, active_color)
            var rot_rad = rotation * rad_conv
            var dot_x = center_x + Int32(cos(rot_rad) * (radius * 0.6))
            var dot_y = center_y + Int32(sin(rot_rad) * (radius * 0.6))
            draw_circle(dot_x, dot_y, max(radius * 0.2, 4.0), WHITE())
        elif toggle_shape.active == 1:
            # Rotating Square (4-sided polygon)
            c.DrawPoly(
                Vector2(Float32(center_x), Float32(center_y)),
                4,
                radius * 1.2,
                rotation + 45.0,
                active_color,
            )
        else:
            # Rotating Triangle (3-sided polygon)
            c.DrawPoly(
                Vector2(Float32(center_x), Float32(center_y)),
                3,
                radius * 1.2,
                rotation,
                active_color,
            )

        # ComboBox rendered after panel so dropdown list draws over other elements
        _ = combo_color.draw()

        # Bottom Status Bar
        _ = Gui.status_bar(
            Rectangle(
                0, Float32(screen_height - 24), Float32(screen_width), 24
            ),
            status_text,
        )

        draw_fps(screen_width - 90, 10)
        end_drawing()

    close_window()


def main_entry():
    main()

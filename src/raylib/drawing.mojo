"""Drawing API for Raylib in Mojo."""

from raylib.types import (
    Color,
    Rectangle,
    Vector2,
    Vector3,
    Camera2D,
    Camera3D,
)
import raylib.c as c

# ===-----------------------------------------------------------------------===#
# Frame Control & Clear
# ===-----------------------------------------------------------------------===#


def begin_drawing():
    """Setup canvas (framebuffer) to start drawing."""
    c.BeginDrawing()


def end_drawing():
    """End canvas drawing and swap buffers (double buffering)."""
    c.EndDrawing()


def clear_background(color: Color):
    """Set background color (framebuffer clear color)."""
    c.ClearBackground(color)


def draw_fps(x: Int32, y: Int32):
    """Draw current FPS counter on screen."""
    var fps = c.GetFPS()
    var color = Color(0, 228, 48, 255) if fps >= 30 else Color(230, 41, 55, 255)
    var fps_str = String(fps) + " FPS\0"
    c.DrawText(fps_str.unsafe_ptr(), x, y, 20, color)


def draw_text(text: String, x: Int32, y: Int32, font_size: Int32, color: Color):
    """Draw text on screen using default font."""
    var text_buf = text + "\0"
    c.DrawText(text_buf.unsafe_ptr(), x, y, font_size, color)


def measure_text(text: String, font_size: Int32) -> Int32:
    """Measure string width for default font."""
    var text_buf = text + "\0"
    return c.MeasureText(text_buf.unsafe_ptr(), font_size)


def draw_rectangle(
    x: Int32, y: Int32, width: Int32, height: Int32, color: Color
):
    """Draw filled rectangle."""
    c.DrawRectangle(x, y, width, height, color)


def draw_rectangle_v(position: Vector2, size: Vector2, color: Color):
    """Draw filled rectangle using Vector2 position and size."""
    c.DrawRectangleV(position, size, color)


def draw_rectangle_rec(rec: Rectangle, color: Color):
    """Draw filled rectangle using Rectangle definition."""
    c.DrawRectangleRec(rec, color)


def draw_rectangle_lines(
    x: Int32, y: Int32, width: Int32, height: Int32, color: Color
):
    """Draw rectangle outline."""
    c.DrawRectangleLines(x, y, width, height, color)


def draw_rectangle_lines_ex(rec: Rectangle, line_thick: Float32, color: Color):
    """Draw rectangle outline with line thickness."""
    c.DrawRectangleLinesEx(rec, line_thick, color)


def draw_circle(
    center_x: Int32, center_y: Int32, radius: Float32, color: Color
):
    """Draw filled circle."""
    c.DrawCircle(center_x, center_y, radius, color)


def draw_circle_v(center: Vector2, radius: Float32, color: Color):
    """Draw filled circle using Vector2 center."""
    c.DrawCircleV(center, radius, color)


def draw_line(
    start_x: Int32, start_y: Int32, end_x: Int32, end_y: Int32, color: Color
):
    """Draw line segment."""
    c.DrawLine(start_x, start_y, end_x, end_y, color)


def draw_line_v(start_pos: Vector2, end_pos: Vector2, color: Color):
    """Draw line segment using Vector2 positions."""
    c.DrawLineV(start_pos, end_pos, color)


def check_collision_recs(rec1: Rectangle, rec2: Rectangle) -> Bool:
    """Check collision between two rectangles."""
    return c.CheckCollisionRecs(rec1, rec2)


def check_collision_circles(
    center1: Vector2, radius1: Float32, center2: Vector2, radius2: Float32
) -> Bool:
    """Check collision between two circles."""
    return c.CheckCollisionCircles(center1, radius1, center2, radius2)


def begin_mode_2d(camera: Camera2D):
    """Begin 2D mode with custom 2D camera."""
    c.BeginMode2D(camera)


def end_mode_2d():
    """End 2D mode with custom 2D camera."""
    c.EndMode2D()


def begin_mode_3d(camera: Camera3D):
    """Begin 3D mode with custom 3D camera."""
    c.BeginMode3D(camera)


def end_mode_3d():
    """End 3D mode with custom 3D camera."""
    c.EndMode3D()


def draw_cube(
    position: Vector3,
    width: Float32,
    height: Float32,
    length: Float32,
    color: Color,
):
    """Draw 3D cube."""
    c.DrawCube(position, width, height, length, color)


def draw_cube_wires(
    position: Vector3,
    width: Float32,
    height: Float32,
    length: Float32,
    color: Color,
):
    """Draw 3D cube wires (outline)."""
    c.DrawCubeWires(position, width, height, length, color)


def draw_sphere(center_pos: Vector3, radius: Float32, color: Color):
    """Draw 3D sphere."""
    c.DrawSphere(center_pos, radius, color)


def draw_sphere_wires(
    center_pos: Vector3,
    radius: Float32,
    rings: Int32,
    slices: Int32,
    color: Color,
):
    """Draw 3D sphere wires (outline)."""
    c.DrawSphereWires(center_pos, radius, rings, slices, color)


def draw_grid(slices: Int32, spacing: Float32):
    """Draw 3D grid centered at origin."""
    c.DrawGrid(slices, spacing)

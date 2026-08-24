"""Windowing and Frame Control API for Raylib in Mojo."""

from std.ffi import c_int
from raylib import c


def init_window(width: Int32, height: Int32, title: String):
    """Initialize window and OpenGL context."""
    var title_buf = title + "\0"
    c.InitWindow(width, height, title_buf.unsafe_ptr())


def window_should_close() -> Bool:
    """Check if KEY_ESCAPE pressed or Close icon clicked."""
    return c.WindowShouldClose()


def close_window():
    """Close window and unload OpenGL context."""
    c.CloseWindow()


def set_target_fps(fps: Int32):
    """Set target FPS (maximum frame rate)."""
    c.SetTargetFPS(fps)


def get_frame_time() -> Float32:
    """Get time elapsed in seconds since last frame."""
    return c.GetFrameTime()


def get_time() -> Float64:
    """Get elapsed time in seconds since init_window()."""
    return c.GetTime()


def get_fps() -> Int32:
    """Get current FPS."""
    return c.GetFPS()


def get_screen_width() -> Int32:
    """Get current screen width."""
    return c.GetScreenWidth()


def get_screen_height() -> Int32:
    """Get current screen height."""
    return c.GetScreenHeight()


def toggle_fullscreen():
    """Toggle window fullscreen mode."""
    c.ToggleFullscreen()


def take_screenshot(file_name: String):
    """Take a screenshot of current frame and save to file_name."""
    var file_buf = file_name + "\0"
    c.TakeScreenshot(file_buf.unsafe_ptr())

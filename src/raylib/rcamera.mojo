"""Camera utility API for Raylib in Mojo."""

from std.memory import Pointer
from raylib.types import Vector3, Matrix, Camera3D
import raylib.c_camera as c_camera


def get_camera_forward(mut camera: Camera3D) -> Vector3:
    """Get camera transform forward vector (unit length)."""
    return c_camera.GetCameraForward(Pointer(to=camera))


def get_camera_up(mut camera: Camera3D) -> Vector3:
    """Get camera transform up vector (unit length)."""
    return c_camera.GetCameraUp(Pointer(to=camera))


def get_camera_right(mut camera: Camera3D) -> Vector3:
    """Get camera transform right vector (unit length)."""
    return c_camera.GetCameraRight(Pointer(to=camera))


def camera_move_forward(
    mut camera: Camera3D, distance: Float32, move_in_world_plane: Bool = True
):
    """Move camera position for target point."""
    c_camera.CameraMoveForward(
        Pointer(to=camera), distance, move_in_world_plane
    )


def camera_move_up(mut camera: Camera3D, distance: Float32):
    """Move camera position up/down."""
    c_camera.CameraMoveUp(Pointer(to=camera), distance)


def camera_move_right(
    mut camera: Camera3D, distance: Float32, move_in_world_plane: Bool = True
):
    """Move camera position right/left."""
    c_camera.CameraMoveRight(Pointer(to=camera), distance, move_in_world_plane)


def camera_move_to_target(mut camera: Camera3D, delta: Float32):
    """Move camera position towards target."""
    c_camera.CameraMoveToTarget(Pointer(to=camera), delta)


def camera_yaw(
    mut camera: Camera3D, angle: Float32, rotate_around_target: Bool = True
):
    """Yaw camera (rotation around Y axis)."""
    c_camera.CameraYaw(Pointer(to=camera), angle, rotate_around_target)


def camera_pitch(
    mut camera: Camera3D,
    angle: Float32,
    lock_view: Bool = True,
    rotate_around_target: Bool = True,
    rotate_up: Bool = False,
):
    """Pitch camera (rotation around X axis)."""
    c_camera.CameraPitch(
        Pointer(to=camera), angle, lock_view, rotate_around_target, rotate_up
    )


def camera_roll(mut camera: Camera3D, angle: Float32):
    """Roll camera (rotation around Z axis)."""
    c_camera.CameraRoll(Pointer(to=camera), angle)


def get_camera_view_matrix(mut camera: Camera3D) -> Matrix:
    """Get camera view matrix."""
    return c_camera.GetCameraViewMatrix(Pointer(to=camera))


def get_camera_projection_matrix(
    mut camera: Camera3D, aspect: Float32
) -> Matrix:
    """Get camera projection matrix."""
    return c_camera.GetCameraProjectionMatrix(Pointer(to=camera), aspect)

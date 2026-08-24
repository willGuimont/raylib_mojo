from std.ffi import external_call, c_int, c_float, c_char
from std.memory import Pointer
from raylib.types import (
    Vector2,
    Vector3,
    Vector4,
    Color,
    Rectangle,
    Camera2D,
    Camera3D,
    Image,
    Texture,
    RenderTexture,
    NPatchInfo,
    GlyphInfo,
    Font,
    Mesh,
    Shader,
    MaterialMap,
    Material,
    Transform,
    BoneInfo,
    Model,
    ModelAnimation,
    Ray,
    RayCollision,
    BoundingBox,
    Wave,
    AudioStream,
    Sound,
    Music,
    VrDeviceInfo,
    VrStereoConfig,
    FilePathList,
    AutomationEvent,
    AutomationEventList,
)


def GetCameraForward(camera: Pointer[Camera3D, origin=_]) -> Vector3:
    return external_call["GetCameraForward", Vector3](camera)


def GetCameraUp(camera: Pointer[Camera3D, origin=_]) -> Vector3:
    return external_call["GetCameraUp", Vector3](camera)


def GetCameraRight(camera: Pointer[Camera3D, origin=_]) -> Vector3:
    return external_call["GetCameraRight", Vector3](camera)


def CameraMoveForward(
    camera: Pointer[Camera3D, origin=_],
    distance: Float32,
    moveInWorldPlane: Bool,
):
    external_call["CameraMoveForward", NoneType](
        camera, distance, moveInWorldPlane
    )


def CameraMoveUp(camera: Pointer[Camera3D, origin=_], distance: Float32):
    external_call["CameraMoveUp", NoneType](camera, distance)


def CameraMoveRight(
    camera: Pointer[Camera3D, origin=_],
    distance: Float32,
    moveInWorldPlane: Bool,
):
    external_call["CameraMoveRight", NoneType](
        camera, distance, moveInWorldPlane
    )


def CameraMoveToTarget(camera: Pointer[Camera3D, origin=_], delta: Float32):
    external_call["CameraMoveToTarget", NoneType](camera, delta)


def CameraYaw(
    camera: Pointer[Camera3D, origin=_],
    angle: Float32,
    rotateAroundTarget: Bool,
):
    external_call["CameraYaw", NoneType](camera, angle, rotateAroundTarget)


def CameraPitch(
    camera: Pointer[Camera3D, origin=_],
    angle: Float32,
    lockView: Bool,
    rotateAroundTarget: Bool,
    rotateUp: Bool,
):
    external_call["CameraPitch", NoneType](
        camera, angle, lockView, rotateAroundTarget, rotateUp
    )


def CameraRoll(camera: Pointer[Camera3D, origin=_], angle: Float32):
    external_call["CameraRoll", NoneType](camera, angle)


def GetCameraViewMatrix(camera: Pointer[Camera3D, origin=_]) -> Matrix:
    return external_call["GetCameraViewMatrix", Matrix](camera)


def GetCameraProjectionMatrix(
    camera: Pointer[Camera3D, origin=_], aspect: Float32
) -> Matrix:
    return external_call["GetCameraProjectionMatrix", Matrix](camera, aspect)

from std.ffi import external_call, c_int, c_float, c_char
from std.memory import Pointer
from std.origin import ImmutAnyOrigin
from raylib.types import (
    Vector2,
    Vector3,
    Vector4,
    Quaternion,
    Matrix,
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


def SetGesturesEnabled(flags: UInt32):
    external_call["SetGesturesEnabled", NoneType](flags)


def IsGestureDetected(gesture: Int32) -> Bool:
    return external_call["IsGestureDetected", Bool](gesture)


def GetGestureDetected() -> Int32:
    return external_call["GetGestureDetected", Int32]()


def GetGestureHoldDuration() -> Float32:
    return external_call["GetGestureHoldDuration", Float32]()


def GetGestureDragVector() -> Vector2:
    return external_call["GetGestureDragVector", Vector2]()


def GetGestureDragAngle() -> Float32:
    return external_call["GetGestureDragAngle", Float32]()


def GetGesturePinchVector() -> Vector2:
    return external_call["GetGesturePinchVector", Vector2]()


def GetGesturePinchAngle() -> Float32:
    return external_call["GetGesturePinchAngle", Float32]()

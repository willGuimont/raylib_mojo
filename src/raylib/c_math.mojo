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


def Clamp(value: Float32, min: Float32, max: Float32) -> Float32:
    return external_call["Clamp", Float32](value, min, max)


def Lerp(start: Float32, end: Float32, amount: Float32) -> Float32:
    return external_call["Lerp", Float32](start, end, amount)


def Normalize(value: Float32, start: Float32, end: Float32) -> Float32:
    return external_call["Normalize", Float32](value, start, end)


def Remap(
    value: Float32,
    inputStart: Float32,
    inputEnd: Float32,
    outputStart: Float32,
    outputEnd: Float32,
) -> Float32:
    return external_call["Remap", Float32](
        value, inputStart, inputEnd, outputStart, outputEnd
    )


def Wrap(value: Float32, min: Float32, max: Float32) -> Float32:
    return external_call["Wrap", Float32](value, min, max)


def FloatEquals(x: Float32, y: Float32) -> Int32:
    return external_call["FloatEquals", Int32](x, y)


def Vector2Zero() -> Vector2:
    return external_call["Vector2Zero", Vector2]()


def Vector2One() -> Vector2:
    return external_call["Vector2One", Vector2]()


def Vector2Add(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Add", Vector2](v1, v2)


def Vector2AddValue(v: Vector2, add: Float32) -> Vector2:
    return external_call["Vector2AddValue", Vector2](v, add)


def Vector2Subtract(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Subtract", Vector2](v1, v2)


def Vector2SubtractValue(v: Vector2, sub: Float32) -> Vector2:
    return external_call["Vector2SubtractValue", Vector2](v, sub)


def Vector2Length(v: Vector2) -> Float32:
    return external_call["Vector2Length", Float32](v)


def Vector2LengthSqr(v: Vector2) -> Float32:
    return external_call["Vector2LengthSqr", Float32](v)


def Vector2DotProduct(v1: Vector2, v2: Vector2) -> Float32:
    return external_call["Vector2DotProduct", Float32](v1, v2)


def Vector2CrossProduct(v1: Vector2, v2: Vector2) -> Float32:
    return external_call["Vector2CrossProduct", Float32](v1, v2)


def Vector2Distance(v1: Vector2, v2: Vector2) -> Float32:
    return external_call["Vector2Distance", Float32](v1, v2)


def Vector2DistanceSqr(v1: Vector2, v2: Vector2) -> Float32:
    return external_call["Vector2DistanceSqr", Float32](v1, v2)


def Vector2Angle(v1: Vector2, v2: Vector2) -> Float32:
    return external_call["Vector2Angle", Float32](v1, v2)


def Vector2LineAngle(start: Vector2, end: Vector2) -> Float32:
    return external_call["Vector2LineAngle", Float32](start, end)


def Vector2Scale(v: Vector2, scale: Float32) -> Vector2:
    return external_call["Vector2Scale", Vector2](v, scale)


def Vector2Multiply(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Multiply", Vector2](v1, v2)


def Vector2Negate(v: Vector2) -> Vector2:
    return external_call["Vector2Negate", Vector2](v)


def Vector2Divide(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Divide", Vector2](v1, v2)


def Vector2Normalize(v: Vector2) -> Vector2:
    return external_call["Vector2Normalize", Vector2](v)


def Vector2Transform(v: Vector2, mat: Matrix) -> Vector2:
    return external_call["Vector2Transform", Vector2](v, mat)


def Vector2Lerp(v1: Vector2, v2: Vector2, amount: Float32) -> Vector2:
    return external_call["Vector2Lerp", Vector2](v1, v2, amount)


def Vector2Reflect(v: Vector2, normal: Vector2) -> Vector2:
    return external_call["Vector2Reflect", Vector2](v, normal)


def Vector2Min(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Min", Vector2](v1, v2)


def Vector2Max(v1: Vector2, v2: Vector2) -> Vector2:
    return external_call["Vector2Max", Vector2](v1, v2)


def Vector2Rotate(v: Vector2, angle: Float32) -> Vector2:
    return external_call["Vector2Rotate", Vector2](v, angle)


def Vector2MoveTowards(
    v: Vector2, target: Vector2, maxDistance: Float32
) -> Vector2:
    return external_call["Vector2MoveTowards", Vector2](v, target, maxDistance)


def Vector2Invert(v: Vector2) -> Vector2:
    return external_call["Vector2Invert", Vector2](v)


def Vector2Clamp(v: Vector2, min: Vector2, max: Vector2) -> Vector2:
    return external_call["Vector2Clamp", Vector2](v, min, max)


def Vector2ClampValue(v: Vector2, min: Float32, max: Float32) -> Vector2:
    return external_call["Vector2ClampValue", Vector2](v, min, max)


def Vector2Equals(p: Vector2, q: Vector2) -> Int32:
    return external_call["Vector2Equals", Int32](p, q)


def Vector2Refract(v: Vector2, n: Vector2, r: Float32) -> Vector2:
    return external_call["Vector2Refract", Vector2](v, n, r)


def Vector3Zero() -> Vector3:
    return external_call["Vector3Zero", Vector3]()


def Vector3One() -> Vector3:
    return external_call["Vector3One", Vector3]()


def Vector3Add(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Add", Vector3](v1, v2)


def Vector3AddValue(v: Vector3, add: Float32) -> Vector3:
    return external_call["Vector3AddValue", Vector3](v, add)


def Vector3Subtract(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Subtract", Vector3](v1, v2)


def Vector3SubtractValue(v: Vector3, sub: Float32) -> Vector3:
    return external_call["Vector3SubtractValue", Vector3](v, sub)


def Vector3Scale(v: Vector3, scalar: Float32) -> Vector3:
    return external_call["Vector3Scale", Vector3](v, scalar)


def Vector3Multiply(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Multiply", Vector3](v1, v2)


def Vector3CrossProduct(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3CrossProduct", Vector3](v1, v2)


def Vector3Perpendicular(v: Vector3) -> Vector3:
    return external_call["Vector3Perpendicular", Vector3](v)


def Vector3Length(v: Vector3) -> Float32:
    return external_call["Vector3Length", Float32](v)


def Vector3LengthSqr(v: Vector3) -> Float32:
    return external_call["Vector3LengthSqr", Float32](v)


def Vector3DotProduct(v1: Vector3, v2: Vector3) -> Float32:
    return external_call["Vector3DotProduct", Float32](v1, v2)


def Vector3Distance(v1: Vector3, v2: Vector3) -> Float32:
    return external_call["Vector3Distance", Float32](v1, v2)


def Vector3DistanceSqr(v1: Vector3, v2: Vector3) -> Float32:
    return external_call["Vector3DistanceSqr", Float32](v1, v2)


def Vector3Angle(v1: Vector3, v2: Vector3) -> Float32:
    return external_call["Vector3Angle", Float32](v1, v2)


def Vector3Negate(v: Vector3) -> Vector3:
    return external_call["Vector3Negate", Vector3](v)


def Vector3Divide(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Divide", Vector3](v1, v2)


def Vector3Normalize(v: Vector3) -> Vector3:
    return external_call["Vector3Normalize", Vector3](v)


def Vector3Project(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Project", Vector3](v1, v2)


def Vector3Reject(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Reject", Vector3](v1, v2)


def Vector3OrthoNormalize(
    v1: Pointer[Vector3, origin=_], v2: Pointer[Vector3, origin=_]
):
    external_call["Vector3OrthoNormalize", NoneType](v1, v2)


def Vector3Transform(v: Vector3, mat: Matrix) -> Vector3:
    return external_call["Vector3Transform", Vector3](v, mat)


def Vector3RotateByQuaternion(v: Vector3, q: Vector4) -> Vector3:
    return external_call["Vector3RotateByQuaternion", Vector3](v, q)


def Vector3RotateByAxisAngle(
    v: Vector3, axis: Vector3, angle: Float32
) -> Vector3:
    return external_call["Vector3RotateByAxisAngle", Vector3](v, axis, angle)


def Vector3MoveTowards(
    v: Vector3, target: Vector3, maxDistance: Float32
) -> Vector3:
    return external_call["Vector3MoveTowards", Vector3](v, target, maxDistance)


def Vector3Lerp(v1: Vector3, v2: Vector3, amount: Float32) -> Vector3:
    return external_call["Vector3Lerp", Vector3](v1, v2, amount)


def Vector3CubicHermite(
    v1: Vector3,
    tangent1: Vector3,
    v2: Vector3,
    tangent2: Vector3,
    amount: Float32,
) -> Vector3:
    return external_call["Vector3CubicHermite", Vector3](
        v1, tangent1, v2, tangent2, amount
    )


def Vector3Reflect(v: Vector3, normal: Vector3) -> Vector3:
    return external_call["Vector3Reflect", Vector3](v, normal)


def Vector3Min(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Min", Vector3](v1, v2)


def Vector3Max(v1: Vector3, v2: Vector3) -> Vector3:
    return external_call["Vector3Max", Vector3](v1, v2)


def Vector3Barycenter(
    p: Vector3, a: Vector3, b: Vector3, c: Vector3
) -> Vector3:
    return external_call["Vector3Barycenter", Vector3](p, a, b, c)


def Vector3Unproject(
    source: Vector3, projection: Matrix, view: Matrix
) -> Vector3:
    return external_call["Vector3Unproject", Vector3](source, projection, view)


def Vector3ToFloatV(v: Vector3) -> Vector3:
    return external_call["Vector3ToFloatV", Vector3](v)


def Vector3Invert(v: Vector3) -> Vector3:
    return external_call["Vector3Invert", Vector3](v)


def Vector3Clamp(v: Vector3, min: Vector3, max: Vector3) -> Vector3:
    return external_call["Vector3Clamp", Vector3](v, min, max)


def Vector3ClampValue(v: Vector3, min: Float32, max: Float32) -> Vector3:
    return external_call["Vector3ClampValue", Vector3](v, min, max)


def Vector3Equals(p: Vector3, q: Vector3) -> Int32:
    return external_call["Vector3Equals", Int32](p, q)


def Vector3Refract(v: Vector3, n: Vector3, r: Float32) -> Vector3:
    return external_call["Vector3Refract", Vector3](v, n, r)


def Vector4Zero() -> Vector4:
    return external_call["Vector4Zero", Vector4]()


def Vector4One() -> Vector4:
    return external_call["Vector4One", Vector4]()


def Vector4Add(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Add", Vector4](v1, v2)


def Vector4AddValue(v: Vector4, add: Float32) -> Vector4:
    return external_call["Vector4AddValue", Vector4](v, add)


def Vector4Subtract(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Subtract", Vector4](v1, v2)


def Vector4SubtractValue(v: Vector4, add: Float32) -> Vector4:
    return external_call["Vector4SubtractValue", Vector4](v, add)


def Vector4Length(v: Vector4) -> Float32:
    return external_call["Vector4Length", Float32](v)


def Vector4LengthSqr(v: Vector4) -> Float32:
    return external_call["Vector4LengthSqr", Float32](v)


def Vector4DotProduct(v1: Vector4, v2: Vector4) -> Float32:
    return external_call["Vector4DotProduct", Float32](v1, v2)


def Vector4Distance(v1: Vector4, v2: Vector4) -> Float32:
    return external_call["Vector4Distance", Float32](v1, v2)


def Vector4DistanceSqr(v1: Vector4, v2: Vector4) -> Float32:
    return external_call["Vector4DistanceSqr", Float32](v1, v2)


def Vector4Scale(v: Vector4, scale: Float32) -> Vector4:
    return external_call["Vector4Scale", Vector4](v, scale)


def Vector4Multiply(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Multiply", Vector4](v1, v2)


def Vector4Negate(v: Vector4) -> Vector4:
    return external_call["Vector4Negate", Vector4](v)


def Vector4Divide(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Divide", Vector4](v1, v2)


def Vector4Normalize(v: Vector4) -> Vector4:
    return external_call["Vector4Normalize", Vector4](v)


def Vector4Min(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Min", Vector4](v1, v2)


def Vector4Max(v1: Vector4, v2: Vector4) -> Vector4:
    return external_call["Vector4Max", Vector4](v1, v2)


def Vector4Lerp(v1: Vector4, v2: Vector4, amount: Float32) -> Vector4:
    return external_call["Vector4Lerp", Vector4](v1, v2, amount)


def Vector4MoveTowards(
    v: Vector4, target: Vector4, maxDistance: Float32
) -> Vector4:
    return external_call["Vector4MoveTowards", Vector4](v, target, maxDistance)


def Vector4Invert(v: Vector4) -> Vector4:
    return external_call["Vector4Invert", Vector4](v)


def Vector4Equals(p: Vector4, q: Vector4) -> Int32:
    return external_call["Vector4Equals", Int32](p, q)


def MatrixDeterminant(mat: Matrix) -> Float32:
    return external_call["MatrixDeterminant", Float32](mat)


def MatrixTrace(mat: Matrix) -> Float32:
    return external_call["MatrixTrace", Float32](mat)


def MatrixTranspose(mat: Matrix) -> Matrix:
    return external_call["MatrixTranspose", Matrix](mat)


def MatrixInvert(mat: Matrix) -> Matrix:
    return external_call["MatrixInvert", Matrix](mat)


def MatrixIdentity() -> Matrix:
    return external_call["MatrixIdentity", Matrix]()


def MatrixAdd(left: Matrix, right: Matrix) -> Matrix:
    return external_call["MatrixAdd", Matrix](left, right)


def MatrixSubtract(left: Matrix, right: Matrix) -> Matrix:
    return external_call["MatrixSubtract", Matrix](left, right)


def MatrixMultiply(left: Matrix, right: Matrix) -> Matrix:
    return external_call["MatrixMultiply", Matrix](left, right)


def MatrixMultiplyValue(left: Matrix, value: Float32) -> Matrix:
    return external_call["MatrixMultiplyValue", Matrix](left, value)


def MatrixTranslate(x: Float32, y: Float32, z: Float32) -> Matrix:
    return external_call["MatrixTranslate", Matrix](x, y, z)


def MatrixRotate(axis: Vector3, angle: Float32) -> Matrix:
    return external_call["MatrixRotate", Matrix](axis, angle)


def MatrixRotateX(angle: Float32) -> Matrix:
    return external_call["MatrixRotateX", Matrix](angle)


def MatrixRotateY(angle: Float32) -> Matrix:
    return external_call["MatrixRotateY", Matrix](angle)


def MatrixRotateZ(angle: Float32) -> Matrix:
    return external_call["MatrixRotateZ", Matrix](angle)


def MatrixRotateXYZ(angle: Vector3) -> Matrix:
    return external_call["MatrixRotateXYZ", Matrix](angle)


def MatrixRotateZYX(angle: Vector3) -> Matrix:
    return external_call["MatrixRotateZYX", Matrix](angle)


def MatrixScale(x: Float32, y: Float32, z: Float32) -> Matrix:
    return external_call["MatrixScale", Matrix](x, y, z)


def MatrixFrustum(
    left: Float64,
    right: Float64,
    bottom: Float64,
    top: Float64,
    nearPlane: Float64,
    farPlane: Float64,
) -> Matrix:
    return external_call["MatrixFrustum", Matrix](
        left, right, bottom, top, nearPlane, farPlane
    )


def MatrixPerspective(
    fovY: Float64, aspect: Float64, nearPlane: Float64, farPlane: Float64
) -> Matrix:
    return external_call["MatrixPerspective", Matrix](
        fovY, aspect, nearPlane, farPlane
    )


def MatrixOrtho(
    left: Float64,
    right: Float64,
    bottom: Float64,
    top: Float64,
    nearPlane: Float64,
    farPlane: Float64,
) -> Matrix:
    return external_call["MatrixOrtho", Matrix](
        left, right, bottom, top, nearPlane, farPlane
    )


def MatrixLookAt(eye: Vector3, target: Vector3, up: Vector3) -> Matrix:
    return external_call["MatrixLookAt", Matrix](eye, target, up)


def MatrixToFloatV(mat: Matrix) -> Matrix:
    return external_call["MatrixToFloatV", Matrix](mat)


def QuaternionAdd(q1: Vector4, q2: Vector4) -> Vector4:
    return external_call["QuaternionAdd", Vector4](q1, q2)


def QuaternionAddValue(q: Vector4, add: Float32) -> Vector4:
    return external_call["QuaternionAddValue", Vector4](q, add)


def QuaternionSubtract(q1: Vector4, q2: Vector4) -> Vector4:
    return external_call["QuaternionSubtract", Vector4](q1, q2)


def QuaternionSubtractValue(q: Vector4, sub: Float32) -> Vector4:
    return external_call["QuaternionSubtractValue", Vector4](q, sub)


def QuaternionIdentity() -> Vector4:
    return external_call["QuaternionIdentity", Vector4]()


def QuaternionLength(q: Vector4) -> Float32:
    return external_call["QuaternionLength", Float32](q)


def QuaternionNormalize(q: Vector4) -> Vector4:
    return external_call["QuaternionNormalize", Vector4](q)


def QuaternionInvert(q: Vector4) -> Vector4:
    return external_call["QuaternionInvert", Vector4](q)


def QuaternionMultiply(q1: Vector4, q2: Vector4) -> Vector4:
    return external_call["QuaternionMultiply", Vector4](q1, q2)


def QuaternionScale(q: Vector4, mul: Float32) -> Vector4:
    return external_call["QuaternionScale", Vector4](q, mul)


def QuaternionDivide(q1: Vector4, q2: Vector4) -> Vector4:
    return external_call["QuaternionDivide", Vector4](q1, q2)


def QuaternionLerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    return external_call["QuaternionLerp", Vector4](q1, q2, amount)


def QuaternionNlerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    return external_call["QuaternionNlerp", Vector4](q1, q2, amount)


def QuaternionSlerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    return external_call["QuaternionSlerp", Vector4](q1, q2, amount)


def QuaternionCubicHermiteSpline(
    q1: Vector4,
    outTangent1: Vector4,
    q2: Vector4,
    inTangent2: Vector4,
    t: Float32,
) -> Vector4:
    return external_call["QuaternionCubicHermiteSpline", Vector4](
        q1, outTangent1, q2, inTangent2, t
    )


def QuaternionFromVector3ToVector3(from_: Vector3, to: Vector3) -> Vector4:
    return external_call["QuaternionFromVector3ToVector3", Vector4](from_, to)


def QuaternionFromMatrix(mat: Matrix) -> Vector4:
    return external_call["QuaternionFromMatrix", Vector4](mat)


def QuaternionToMatrix(q: Vector4) -> Matrix:
    return external_call["QuaternionToMatrix", Matrix](q)


def QuaternionFromAxisAngle(axis: Vector3, angle: Float32) -> Vector4:
    return external_call["QuaternionFromAxisAngle", Vector4](axis, angle)


def QuaternionToAxisAngle(
    q: Vector4,
    outAxis: Pointer[Vector3, origin=_],
    outAngle: Pointer[Float32, origin=_],
):
    external_call["QuaternionToAxisAngle", NoneType](q, outAxis, outAngle)


def QuaternionFromEuler(pitch: Float32, yaw: Float32, roll: Float32) -> Vector4:
    return external_call["QuaternionFromEuler", Vector4](pitch, yaw, roll)


def QuaternionToEuler(q: Vector4) -> Vector3:
    return external_call["QuaternionToEuler", Vector3](q)


def QuaternionTransform(q: Vector4, mat: Matrix) -> Vector4:
    return external_call["QuaternionTransform", Vector4](q, mat)


def QuaternionEquals(p: Vector4, q: Vector4) -> Int32:
    return external_call["QuaternionEquals", Int32](p, q)


def MatrixCompose(
    translation: Vector3, rotation: Vector4, scale: Vector3
) -> Matrix:
    return external_call["MatrixCompose", Matrix](translation, rotation, scale)


def MatrixDecompose(
    mat: Matrix,
    translation: Pointer[Vector3, origin=_],
    rotation: Pointer[Vector4, origin=_],
    scale: Pointer[Vector3, origin=_],
):
    external_call["MatrixDecompose", NoneType](
        mat, translation, rotation, scale
    )

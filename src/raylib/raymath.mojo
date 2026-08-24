"""Vector, matrix, and quaternion math API for Raylib in Mojo."""

from std.memory import Pointer
from raylib.types import Vector2, Vector3, Vector4, Matrix
import raylib.c_math as c_math


def clamp(value: Float32, min: Float32, max: Float32) -> Float32:
    """Wrap Clamp."""
    return c_math.Clamp(value, min, max)


def lerp(start: Float32, end: Float32, amount: Float32) -> Float32:
    """Wrap Lerp."""
    return c_math.Lerp(start, end, amount)


def normalize(value: Float32, start: Float32, end: Float32) -> Float32:
    """Wrap Normalize."""
    return c_math.Normalize(value, start, end)


def wrap(value: Float32, min: Float32, max: Float32) -> Float32:
    """Wrap Wrap."""
    return c_math.Wrap(value, min, max)


def float_equals(x: Float32, y: Float32) -> Int32:
    """Wrap FloatEquals."""
    return c_math.FloatEquals(x, y)


def vector2_zero() -> Vector2:
    """Wrap Vector2Zero."""
    return c_math.Vector2Zero()


def vector2_one() -> Vector2:
    """Wrap Vector2One."""
    return c_math.Vector2One()


def vector2_add(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Add."""
    return c_math.Vector2Add(v1, v2)


def vector2_add_value(v: Vector2, add: Float32) -> Vector2:
    """Wrap Vector2AddValue."""
    return c_math.Vector2AddValue(v, add)


def vector2_subtract(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Subtract."""
    return c_math.Vector2Subtract(v1, v2)


def vector2_subtract_value(v: Vector2, sub: Float32) -> Vector2:
    """Wrap Vector2SubtractValue."""
    return c_math.Vector2SubtractValue(v, sub)


def vector2_length(v: Vector2) -> Float32:
    """Wrap Vector2Length."""
    return c_math.Vector2Length(v)


def vector2_length_sqr(v: Vector2) -> Float32:
    """Wrap Vector2LengthSqr."""
    return c_math.Vector2LengthSqr(v)


def vector2_dot_product(v1: Vector2, v2: Vector2) -> Float32:
    """Wrap Vector2DotProduct."""
    return c_math.Vector2DotProduct(v1, v2)


def vector2_cross_product(v1: Vector2, v2: Vector2) -> Float32:
    """Wrap Vector2CrossProduct."""
    return c_math.Vector2CrossProduct(v1, v2)


def vector2_distance(v1: Vector2, v2: Vector2) -> Float32:
    """Wrap Vector2Distance."""
    return c_math.Vector2Distance(v1, v2)


def vector2_distance_sqr(v1: Vector2, v2: Vector2) -> Float32:
    """Wrap Vector2DistanceSqr."""
    return c_math.Vector2DistanceSqr(v1, v2)


def vector2_angle(v1: Vector2, v2: Vector2) -> Float32:
    """Wrap Vector2Angle."""
    return c_math.Vector2Angle(v1, v2)


def vector2_line_angle(start: Vector2, end: Vector2) -> Float32:
    """Wrap Vector2LineAngle."""
    return c_math.Vector2LineAngle(start, end)


def vector2_scale(v: Vector2, scale: Float32) -> Vector2:
    """Wrap Vector2Scale."""
    return c_math.Vector2Scale(v, scale)


def vector2_multiply(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Multiply."""
    return c_math.Vector2Multiply(v1, v2)


def vector2_negate(v: Vector2) -> Vector2:
    """Wrap Vector2Negate."""
    return c_math.Vector2Negate(v)


def vector2_divide(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Divide."""
    return c_math.Vector2Divide(v1, v2)


def vector2_normalize(v: Vector2) -> Vector2:
    """Wrap Vector2Normalize."""
    return c_math.Vector2Normalize(v)


def vector2_transform(v: Vector2, mat: Matrix) -> Vector2:
    """Wrap Vector2Transform."""
    return c_math.Vector2Transform(v, mat)


def vector2_lerp(v1: Vector2, v2: Vector2, amount: Float32) -> Vector2:
    """Wrap Vector2Lerp."""
    return c_math.Vector2Lerp(v1, v2, amount)


def vector2_reflect(v: Vector2, normal: Vector2) -> Vector2:
    """Wrap Vector2Reflect."""
    return c_math.Vector2Reflect(v, normal)


def vector2_min(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Min."""
    return c_math.Vector2Min(v1, v2)


def vector2_max(v1: Vector2, v2: Vector2) -> Vector2:
    """Wrap Vector2Max."""
    return c_math.Vector2Max(v1, v2)


def vector2_rotate(v: Vector2, angle: Float32) -> Vector2:
    """Wrap Vector2Rotate."""
    return c_math.Vector2Rotate(v, angle)


def vector2_invert(v: Vector2) -> Vector2:
    """Wrap Vector2Invert."""
    return c_math.Vector2Invert(v)


def vector2_clamp(v: Vector2, min: Vector2, max: Vector2) -> Vector2:
    """Wrap Vector2Clamp."""
    return c_math.Vector2Clamp(v, min, max)


def vector2_clamp_value(v: Vector2, min: Float32, max: Float32) -> Vector2:
    """Wrap Vector2ClampValue."""
    return c_math.Vector2ClampValue(v, min, max)


def vector2_equals(p: Vector2, q: Vector2) -> Int32:
    """Wrap Vector2Equals."""
    return c_math.Vector2Equals(p, q)


def vector2_refract(v: Vector2, n: Vector2, r: Float32) -> Vector2:
    """Wrap Vector2Refract."""
    return c_math.Vector2Refract(v, n, r)


def vector3_zero() -> Vector3:
    """Wrap Vector3Zero."""
    return c_math.Vector3Zero()


def vector3_one() -> Vector3:
    """Wrap Vector3One."""
    return c_math.Vector3One()


def vector3_add(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Add."""
    return c_math.Vector3Add(v1, v2)


def vector3_add_value(v: Vector3, add: Float32) -> Vector3:
    """Wrap Vector3AddValue."""
    return c_math.Vector3AddValue(v, add)


def vector3_subtract(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Subtract."""
    return c_math.Vector3Subtract(v1, v2)


def vector3_subtract_value(v: Vector3, sub: Float32) -> Vector3:
    """Wrap Vector3SubtractValue."""
    return c_math.Vector3SubtractValue(v, sub)


def vector3_scale(v: Vector3, scalar: Float32) -> Vector3:
    """Wrap Vector3Scale."""
    return c_math.Vector3Scale(v, scalar)


def vector3_multiply(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Multiply."""
    return c_math.Vector3Multiply(v1, v2)


def vector3_cross_product(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3CrossProduct."""
    return c_math.Vector3CrossProduct(v1, v2)


def vector3_perpendicular(v: Vector3) -> Vector3:
    """Wrap Vector3Perpendicular."""
    return c_math.Vector3Perpendicular(v)


def vector3_length(v: Vector3) -> Float32:
    """Wrap Vector3Length."""
    return c_math.Vector3Length(v)


def vector3_length_sqr(v: Vector3) -> Float32:
    """Wrap Vector3LengthSqr."""
    return c_math.Vector3LengthSqr(v)


def vector3_dot_product(v1: Vector3, v2: Vector3) -> Float32:
    """Wrap Vector3DotProduct."""
    return c_math.Vector3DotProduct(v1, v2)


def vector3_distance(v1: Vector3, v2: Vector3) -> Float32:
    """Wrap Vector3Distance."""
    return c_math.Vector3Distance(v1, v2)


def vector3_distance_sqr(v1: Vector3, v2: Vector3) -> Float32:
    """Wrap Vector3DistanceSqr."""
    return c_math.Vector3DistanceSqr(v1, v2)


def vector3_angle(v1: Vector3, v2: Vector3) -> Float32:
    """Wrap Vector3Angle."""
    return c_math.Vector3Angle(v1, v2)


def vector3_negate(v: Vector3) -> Vector3:
    """Wrap Vector3Negate."""
    return c_math.Vector3Negate(v)


def vector3_divide(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Divide."""
    return c_math.Vector3Divide(v1, v2)


def vector3_normalize(v: Vector3) -> Vector3:
    """Wrap Vector3Normalize."""
    return c_math.Vector3Normalize(v)


def vector3_project(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Project."""
    return c_math.Vector3Project(v1, v2)


def vector3_reject(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Reject."""
    return c_math.Vector3Reject(v1, v2)


def vector3_transform(v: Vector3, mat: Matrix) -> Vector3:
    """Wrap Vector3Transform."""
    return c_math.Vector3Transform(v, mat)


def vector3_rotate_by_quaternion(v: Vector3, q: Vector4) -> Vector3:
    """Wrap Vector3RotateByQuaternion."""
    return c_math.Vector3RotateByQuaternion(v, q)


def vector3_lerp(v1: Vector3, v2: Vector3, amount: Float32) -> Vector3:
    """Wrap Vector3Lerp."""
    return c_math.Vector3Lerp(v1, v2, amount)


def vector3_reflect(v: Vector3, normal: Vector3) -> Vector3:
    """Wrap Vector3Reflect."""
    return c_math.Vector3Reflect(v, normal)


def vector3_min(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Min."""
    return c_math.Vector3Min(v1, v2)


def vector3_max(v1: Vector3, v2: Vector3) -> Vector3:
    """Wrap Vector3Max."""
    return c_math.Vector3Max(v1, v2)


def vector3_to_float_v(v: Vector3) -> Vector3:
    """Wrap Vector3ToFloatV."""
    return c_math.Vector3ToFloatV(v)


def vector3_invert(v: Vector3) -> Vector3:
    """Wrap Vector3Invert."""
    return c_math.Vector3Invert(v)


def vector3_clamp(v: Vector3, min: Vector3, max: Vector3) -> Vector3:
    """Wrap Vector3Clamp."""
    return c_math.Vector3Clamp(v, min, max)


def vector3_clamp_value(v: Vector3, min: Float32, max: Float32) -> Vector3:
    """Wrap Vector3ClampValue."""
    return c_math.Vector3ClampValue(v, min, max)


def vector3_equals(p: Vector3, q: Vector3) -> Int32:
    """Wrap Vector3Equals."""
    return c_math.Vector3Equals(p, q)


def vector3_refract(v: Vector3, n: Vector3, r: Float32) -> Vector3:
    """Wrap Vector3Refract."""
    return c_math.Vector3Refract(v, n, r)


def vector4_zero() -> Vector4:
    """Wrap Vector4Zero."""
    return c_math.Vector4Zero()


def vector4_one() -> Vector4:
    """Wrap Vector4One."""
    return c_math.Vector4One()


def vector4_add(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Add."""
    return c_math.Vector4Add(v1, v2)


def vector4_add_value(v: Vector4, add: Float32) -> Vector4:
    """Wrap Vector4AddValue."""
    return c_math.Vector4AddValue(v, add)


def vector4_subtract(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Subtract."""
    return c_math.Vector4Subtract(v1, v2)


def vector4_subtract_value(v: Vector4, add: Float32) -> Vector4:
    """Wrap Vector4SubtractValue."""
    return c_math.Vector4SubtractValue(v, add)


def vector4_length(v: Vector4) -> Float32:
    """Wrap Vector4Length."""
    return c_math.Vector4Length(v)


def vector4_length_sqr(v: Vector4) -> Float32:
    """Wrap Vector4LengthSqr."""
    return c_math.Vector4LengthSqr(v)


def vector4_dot_product(v1: Vector4, v2: Vector4) -> Float32:
    """Wrap Vector4DotProduct."""
    return c_math.Vector4DotProduct(v1, v2)


def vector4_distance(v1: Vector4, v2: Vector4) -> Float32:
    """Wrap Vector4Distance."""
    return c_math.Vector4Distance(v1, v2)


def vector4_distance_sqr(v1: Vector4, v2: Vector4) -> Float32:
    """Wrap Vector4DistanceSqr."""
    return c_math.Vector4DistanceSqr(v1, v2)


def vector4_scale(v: Vector4, scale: Float32) -> Vector4:
    """Wrap Vector4Scale."""
    return c_math.Vector4Scale(v, scale)


def vector4_multiply(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Multiply."""
    return c_math.Vector4Multiply(v1, v2)


def vector4_negate(v: Vector4) -> Vector4:
    """Wrap Vector4Negate."""
    return c_math.Vector4Negate(v)


def vector4_divide(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Divide."""
    return c_math.Vector4Divide(v1, v2)


def vector4_normalize(v: Vector4) -> Vector4:
    """Wrap Vector4Normalize."""
    return c_math.Vector4Normalize(v)


def vector4_min(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Min."""
    return c_math.Vector4Min(v1, v2)


def vector4_max(v1: Vector4, v2: Vector4) -> Vector4:
    """Wrap Vector4Max."""
    return c_math.Vector4Max(v1, v2)


def vector4_lerp(v1: Vector4, v2: Vector4, amount: Float32) -> Vector4:
    """Wrap Vector4Lerp."""
    return c_math.Vector4Lerp(v1, v2, amount)


def vector4_invert(v: Vector4) -> Vector4:
    """Wrap Vector4Invert."""
    return c_math.Vector4Invert(v)


def vector4_equals(p: Vector4, q: Vector4) -> Int32:
    """Wrap Vector4Equals."""
    return c_math.Vector4Equals(p, q)


def matrix_determinant(mat: Matrix) -> Float32:
    """Wrap MatrixDeterminant."""
    return c_math.MatrixDeterminant(mat)


def matrix_trace(mat: Matrix) -> Float32:
    """Wrap MatrixTrace."""
    return c_math.MatrixTrace(mat)


def matrix_transpose(mat: Matrix) -> Matrix:
    """Wrap MatrixTranspose."""
    return c_math.MatrixTranspose(mat)


def matrix_invert(mat: Matrix) -> Matrix:
    """Wrap MatrixInvert."""
    return c_math.MatrixInvert(mat)


def matrix_identity() -> Matrix:
    """Wrap MatrixIdentity."""
    return c_math.MatrixIdentity()


def matrix_add(left: Matrix, right: Matrix) -> Matrix:
    """Wrap MatrixAdd."""
    return c_math.MatrixAdd(left, right)


def matrix_subtract(left: Matrix, right: Matrix) -> Matrix:
    """Wrap MatrixSubtract."""
    return c_math.MatrixSubtract(left, right)


def matrix_multiply(left: Matrix, right: Matrix) -> Matrix:
    """Wrap MatrixMultiply."""
    return c_math.MatrixMultiply(left, right)


def matrix_multiply_value(left: Matrix, value: Float32) -> Matrix:
    """Wrap MatrixMultiplyValue."""
    return c_math.MatrixMultiplyValue(left, value)


def matrix_translate(x: Float32, y: Float32, z: Float32) -> Matrix:
    """Wrap MatrixTranslate."""
    return c_math.MatrixTranslate(x, y, z)


def matrix_rotate(axis: Vector3, angle: Float32) -> Matrix:
    """Wrap MatrixRotate."""
    return c_math.MatrixRotate(axis, angle)


def matrix_rotate_x(angle: Float32) -> Matrix:
    """Wrap MatrixRotateX."""
    return c_math.MatrixRotateX(angle)


def matrix_rotate_y(angle: Float32) -> Matrix:
    """Wrap MatrixRotateY."""
    return c_math.MatrixRotateY(angle)


def matrix_rotate_z(angle: Float32) -> Matrix:
    """Wrap MatrixRotateZ."""
    return c_math.MatrixRotateZ(angle)


def matrix_rotate_xyz(angle: Vector3) -> Matrix:
    """Wrap MatrixRotateXYZ."""
    return c_math.MatrixRotateXYZ(angle)


def matrix_rotate_zyx(angle: Vector3) -> Matrix:
    """Wrap MatrixRotateZYX."""
    return c_math.MatrixRotateZYX(angle)


def matrix_scale(x: Float32, y: Float32, z: Float32) -> Matrix:
    """Wrap MatrixScale."""
    return c_math.MatrixScale(x, y, z)


def matrix_look_at(eye: Vector3, target: Vector3, up: Vector3) -> Matrix:
    """Wrap MatrixLookAt."""
    return c_math.MatrixLookAt(eye, target, up)


def matrix_to_float_v(mat: Matrix) -> Matrix:
    """Wrap MatrixToFloatV."""
    return c_math.MatrixToFloatV(mat)


def quaternion_add(q1: Vector4, q2: Vector4) -> Vector4:
    """Wrap QuaternionAdd."""
    return c_math.QuaternionAdd(q1, q2)


def quaternion_add_value(q: Vector4, add: Float32) -> Vector4:
    """Wrap QuaternionAddValue."""
    return c_math.QuaternionAddValue(q, add)


def quaternion_subtract(q1: Vector4, q2: Vector4) -> Vector4:
    """Wrap QuaternionSubtract."""
    return c_math.QuaternionSubtract(q1, q2)


def quaternion_subtract_value(q: Vector4, sub: Float32) -> Vector4:
    """Wrap QuaternionSubtractValue."""
    return c_math.QuaternionSubtractValue(q, sub)


def quaternion_identity() -> Vector4:
    """Wrap QuaternionIdentity."""
    return c_math.QuaternionIdentity()


def quaternion_length(q: Vector4) -> Float32:
    """Wrap QuaternionLength."""
    return c_math.QuaternionLength(q)


def quaternion_normalize(q: Vector4) -> Vector4:
    """Wrap QuaternionNormalize."""
    return c_math.QuaternionNormalize(q)


def quaternion_invert(q: Vector4) -> Vector4:
    """Wrap QuaternionInvert."""
    return c_math.QuaternionInvert(q)


def quaternion_multiply(q1: Vector4, q2: Vector4) -> Vector4:
    """Wrap QuaternionMultiply."""
    return c_math.QuaternionMultiply(q1, q2)


def quaternion_scale(q: Vector4, mul: Float32) -> Vector4:
    """Wrap QuaternionScale."""
    return c_math.QuaternionScale(q, mul)


def quaternion_divide(q1: Vector4, q2: Vector4) -> Vector4:
    """Wrap QuaternionDivide."""
    return c_math.QuaternionDivide(q1, q2)


def quaternion_lerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    """Wrap QuaternionLerp."""
    return c_math.QuaternionLerp(q1, q2, amount)


def quaternion_nlerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    """Wrap QuaternionNlerp."""
    return c_math.QuaternionNlerp(q1, q2, amount)


def quaternion_slerp(q1: Vector4, q2: Vector4, amount: Float32) -> Vector4:
    """Wrap QuaternionSlerp."""
    return c_math.QuaternionSlerp(q1, q2, amount)


def quaternion_from_vector3_to_vector3(from_: Vector3, to: Vector3) -> Vector4:
    """Wrap QuaternionFromVector3ToVector3."""
    return c_math.QuaternionFromVector3ToVector3(from_, to)


def quaternion_from_matrix(mat: Matrix) -> Vector4:
    """Wrap QuaternionFromMatrix."""
    return c_math.QuaternionFromMatrix(mat)


def quaternion_to_matrix(q: Vector4) -> Matrix:
    """Wrap QuaternionToMatrix."""
    return c_math.QuaternionToMatrix(q)


def quaternion_from_axis_angle(axis: Vector3, angle: Float32) -> Vector4:
    """Wrap QuaternionFromAxisAngle."""
    return c_math.QuaternionFromAxisAngle(axis, angle)


def quaternion_from_euler(
    pitch: Float32, yaw: Float32, roll: Float32
) -> Vector4:
    """Wrap QuaternionFromEuler."""
    return c_math.QuaternionFromEuler(pitch, yaw, roll)


def quaternion_to_euler(q: Vector4) -> Vector3:
    """Wrap QuaternionToEuler."""
    return c_math.QuaternionToEuler(q)


def quaternion_transform(q: Vector4, mat: Matrix) -> Vector4:
    """Wrap QuaternionTransform."""
    return c_math.QuaternionTransform(q, mat)


def quaternion_equals(p: Vector4, q: Vector4) -> Int32:
    """Wrap QuaternionEquals."""
    return c_math.QuaternionEquals(p, q)

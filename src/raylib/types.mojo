"""Raylib primitive types and C-compatible structs."""

from std.ffi import c_int, c_uint, c_float, c_char
from std.math import abs, sqrt, sin, cos, acos, asin, atan2, min, max


struct Vector2(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Vector2 type (2 float components)."""

    var x: Float32
    var y: Float32

    def __init__(out self, x: Float32 = 0.0, y: Float32 = 0.0):
        self.x = x
        self.y = y

    # --- Constructors & Factories ---
    @staticmethod
    @always_inline
    def zero() -> Self:
        return Self(0.0, 0.0)

    @staticmethod
    @always_inline
    def one() -> Self:
        return Self(1.0, 1.0)

    # --- Math Methods ---
    @always_inline
    def dot(self, other: Self) -> Float32:
        return self.x * other.x + self.y * other.y

    @always_inline
    def cross(self, other: Self) -> Float32:
        return self.x * other.y - self.y * other.x

    @always_inline
    def length_sqr(self) -> Float32:
        return self.dot(self)

    @always_inline
    def length(self) -> Float32:
        return sqrt(self.length_sqr())

    @always_inline
    def distance_sqr(self, other: Self) -> Float32:
        return (self - other).length_sqr()

    @always_inline
    def distance(self, other: Self) -> Float32:
        return (self - other).length()

    @always_inline
    def angle(self, other: Self) -> Float32:
        return atan2(
            self.x * other.y - self.y * other.x,
            self.x * other.x + self.y * other.y,
        )

    @always_inline
    def normalize(self) -> Self:
        var len = self.length()
        if len > 0.0001:
            return self / len
        return Self()

    @always_inline
    def lerp(self, to: Self, amount: Float32) -> Self:
        return self + (to - self) * amount

    @always_inline
    def reflect(self, normal: Self) -> Self:
        return self - normal * (2.0 * self.dot(normal))

    @always_inline
    def refract(self, normal: Self, r: Float32) -> Self:
        var dot_val = self.dot(normal)
        var k = 1.0 - r * r * (1.0 - dot_val * dot_val)
        if k < 0.0:
            return Self()
        return self * r - normal * (r * dot_val + sqrt(k))

    @always_inline
    def rotate(self, angle: Float32) -> Self:
        var cos_a = cos(angle)
        var sin_a = sin(angle)
        return Self(
            self.x * cos_a - self.y * sin_a, self.x * sin_a + self.y * cos_a
        )

    @always_inline
    def min(self, other: Self) -> Self:
        return Self(min(self.x, other.x), min(self.y, other.y))

    @always_inline
    def max(self, other: Self) -> Self:
        return Self(max(self.x, other.x), max(self.y, other.y))

    @always_inline
    def clamp(self, min_val: Self, max_val: Self) -> Self:
        return Self(
            min(max(self.x, min_val.x), max_val.x),
            min(max(self.y, min_val.y), max_val.y),
        )

    @always_inline
    def clamp_value(self, min_val: Float32, max_val: Float32) -> Self:
        return Self(
            min(max(self.x, min_val), max_val),
            min(max(self.y, min_val), max_val),
        )

    # --- Operator Overloads ---
    @always_inline
    def __add__(self, other: Self) -> Self:
        return Self(self.x + other.x, self.y + other.y)

    @always_inline
    def __add__(self, value: Float32) -> Self:
        return Self(self.x + value, self.y + value)

    @always_inline
    def __radd__(self, value: Float32) -> Self:
        return self + value

    @always_inline
    def __iadd__(mut self, other: Self):
        self.x += other.x
        self.y += other.y

    @always_inline
    def __iadd__(mut self, value: Float32):
        self.x += value
        self.y += value

    @always_inline
    def __sub__(self, other: Self) -> Self:
        return Self(self.x - other.x, self.y - other.y)

    @always_inline
    def __sub__(self, value: Float32) -> Self:
        return Self(self.x - value, self.y - value)

    @always_inline
    def __rsub__(self, value: Float32) -> Self:
        return Self(value - self.x, value - self.y)

    @always_inline
    def __isub__(mut self, other: Self):
        self.x -= other.x
        self.y -= other.y

    @always_inline
    def __isub__(mut self, value: Float32):
        self.x -= value
        self.y -= value

    @always_inline
    def __mul__(self, s: Float32) -> Self:
        return Self(self.x * s, self.y * s)

    @always_inline
    def __mul__(self, other: Self) -> Self:
        return Self(self.x * other.x, self.y * other.y)

    @always_inline
    def __rmul__(self, s: Float32) -> Self:
        return self * s

    @always_inline
    def __imul__(mut self, s: Float32):
        self.x *= s
        self.y *= s

    @always_inline
    def __imul__(mut self, other: Self):
        self.x *= other.x
        self.y *= other.y

    @always_inline
    def __truediv__(self, s: Float32) -> Self:
        return Self(self.x / s, self.y / s)

    @always_inline
    def __truediv__(self, other: Self) -> Self:
        return Self(self.x / other.x, self.y / other.y)

    @always_inline
    def __itruediv__(mut self, s: Float32):
        self.x /= s
        self.y /= s

    @always_inline
    def __itruediv__(mut self, other: Self):
        self.x /= other.x
        self.y /= other.y

    @always_inline
    def __neg__(self) -> Self:
        return Self(-self.x, -self.y)

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return self.x == other.x and self.y == other.y

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)


struct Vector3(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Vector3 type (3 float components)."""

    var x: Float32
    var y: Float32
    var z: Float32

    def __init__(
        out self,
        x: Float32 = 0.0,
        y: Float32 = 0.0,
        z: Float32 = 0.0,
    ):
        self.x = x
        self.y = y
        self.z = z

    # --- Constructors & Factories ---
    @staticmethod
    @always_inline
    def zero() -> Self:
        return Self(0.0, 0.0, 0.0)

    @staticmethod
    @always_inline
    def one() -> Self:
        return Self(1.0, 1.0, 1.0)

    # --- Vector Math Methods ---
    @always_inline
    def dot(self, other: Self) -> Float32:
        return self.x * other.x + self.y * other.y + self.z * other.z

    @always_inline
    def cross(self, other: Self) -> Self:
        return Self(
            self.y * other.z - self.z * other.y,
            self.z * other.x - self.x * other.z,
            self.x * other.y - self.y * other.x,
        )

    @always_inline
    def length_sqr(self) -> Float32:
        return self.dot(self)

    @always_inline
    def length(self) -> Float32:
        return sqrt(self.length_sqr())

    @always_inline
    def distance_sqr(self, other: Self) -> Float32:
        return (self - other).length_sqr()

    @always_inline
    def distance(self, other: Self) -> Float32:
        return (self - other).length()

    @always_inline
    def angle(self, other: Self) -> Float32:
        var cross_v = self.cross(other)
        var len_cross = cross_v.length()
        var dot_v = self.dot(other)
        return atan2(len_cross, dot_v)

    @always_inline
    def normalize(self) -> Self:
        var len = self.length()
        if len > 0.0001:
            return self / len
        return Self()

    @always_inline
    def lerp(self, to: Self, amount: Float32) -> Self:
        return self + (to - self) * amount

    @always_inline
    def reflect(self, normal: Self) -> Self:
        return self - normal * (2.0 * self.dot(normal))

    @always_inline
    def refract(self, normal: Self, r: Float32) -> Self:
        var dot_val = self.dot(normal)
        var k = 1.0 - r * r * (1.0 - dot_val * dot_val)
        if k < 0.0:
            return Self()
        return self * r - normal * (r * dot_val + sqrt(k))

    @always_inline
    def perpendicular(self) -> Self:
        var min_val = abs(self.x)
        var cardinal = Self(1.0, 0.0, 0.0)
        if abs(self.y) < min_val:
            min_val = abs(self.y)
            cardinal = Self(0.0, 1.0, 0.0)
        if abs(self.z) < min_val:
            cardinal = Self(0.0, 0.0, 1.0)
        return self.cross(cardinal)

    @always_inline
    def project(self, onto: Self) -> Self:
        var onto_len_sq = onto.length_sqr()
        if onto_len_sq == 0.0:
            return Self()
        return onto * (self.dot(onto) / onto_len_sq)

    @always_inline
    def reject(self, from_v: Self) -> Self:
        return self - self.project(from_v)

    @always_inline
    def min(self, other: Self) -> Self:
        return Self(
            min(self.x, other.x), min(self.y, other.y), min(self.z, other.z)
        )

    @always_inline
    def max(self, other: Self) -> Self:
        return Self(
            max(self.x, other.x), max(self.y, other.y), max(self.z, other.z)
        )

    @always_inline
    def clamp(self, min_val: Self, max_val: Self) -> Self:
        return Self(
            min(max(self.x, min_val.x), max_val.x),
            min(max(self.y, min_val.y), max_val.y),
            min(max(self.z, min_val.z), max_val.z),
        )

    @always_inline
    def clamp_value(self, min_val: Float32, max_val: Float32) -> Self:
        return Self(
            min(max(self.x, min_val), max_val),
            min(max(self.y, min_val), max_val),
            min(max(self.z, min_val), max_val),
        )

    # --- Operator Overloads ---
    @always_inline
    def __add__(self, other: Self) -> Self:
        return Self(self.x + other.x, self.y + other.y, self.z + other.z)

    @always_inline
    def __add__(self, value: Float32) -> Self:
        return Self(self.x + value, self.y + value, self.z + value)

    @always_inline
    def __radd__(self, value: Float32) -> Self:
        return self + value

    @always_inline
    def __iadd__(mut self, other: Self):
        self.x += other.x
        self.y += other.y
        self.z += other.z

    @always_inline
    def __iadd__(mut self, value: Float32):
        self.x += value
        self.y += value
        self.z += value

    @always_inline
    def __sub__(self, other: Self) -> Self:
        return Self(self.x - other.x, self.y - other.y, self.z - other.z)

    @always_inline
    def __sub__(self, value: Float32) -> Self:
        return Self(self.x - value, self.y - value, self.z - value)

    @always_inline
    def __rsub__(self, value: Float32) -> Self:
        return Self(value - self.x, value - self.y, value - self.z)

    @always_inline
    def __isub__(mut self, other: Self):
        self.x -= other.x
        self.y -= other.y
        self.z -= other.z

    @always_inline
    def __isub__(mut self, value: Float32):
        self.x -= value
        self.y -= value
        self.z -= value

    @always_inline
    def __mul__(self, s: Float32) -> Self:
        return Self(self.x * s, self.y * s, self.z * s)

    @always_inline
    def __mul__(self, other: Self) -> Self:
        return Self(self.x * other.x, self.y * other.y, self.z * other.z)

    @always_inline
    def __rmul__(self, s: Float32) -> Self:
        return self * s

    @always_inline
    def __imul__(mut self, s: Float32):
        self.x *= s
        self.y *= s
        self.z *= s

    @always_inline
    def __imul__(mut self, other: Self):
        self.x *= other.x
        self.y *= other.y
        self.z *= other.z

    @always_inline
    def __truediv__(self, s: Float32) -> Self:
        return Self(self.x / s, self.y / s, self.z / s)

    @always_inline
    def __truediv__(self, other: Self) -> Self:
        return Self(self.x / other.x, self.y / other.y, self.z / other.z)

    @always_inline
    def __itruediv__(mut self, s: Float32):
        self.x /= s
        self.y /= s
        self.z /= s

    @always_inline
    def __itruediv__(mut self, other: Self):
        self.x /= other.x
        self.y /= other.y
        self.z /= other.z

    @always_inline
    def __neg__(self) -> Self:
        return Self(-self.x, -self.y, -self.z)

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return self.x == other.x and self.y == other.y and self.z == other.z

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)


struct Vector4(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Vector4 type (4 float components)."""

    var x: Float32
    var y: Float32
    var z: Float32
    var w: Float32

    def __init__(
        out self,
        x: Float32 = 0.0,
        y: Float32 = 0.0,
        z: Float32 = 0.0,
        w: Float32 = 0.0,
    ):
        self.x = x
        self.y = y
        self.z = z
        self.w = w

    # --- Constructors & Factories ---
    @staticmethod
    @always_inline
    def zero() -> Self:
        return Self(0.0, 0.0, 0.0, 0.0)

    @staticmethod
    @always_inline
    def one() -> Self:
        return Self(1.0, 1.0, 1.0, 1.0)

    # --- Math Methods ---
    @always_inline
    def dot(self, other: Self) -> Float32:
        return (
            self.x * other.x
            + self.y * other.y
            + self.z * other.z
            + self.w * other.w
        )

    @always_inline
    def length_sqr(self) -> Float32:
        return self.dot(self)

    @always_inline
    def length(self) -> Float32:
        return sqrt(self.length_sqr())

    @always_inline
    def distance_sqr(self, other: Self) -> Float32:
        return (self - other).length_sqr()

    @always_inline
    def distance(self, other: Self) -> Float32:
        return (self - other).length()

    @always_inline
    def normalize(self) -> Self:
        var len = self.length()
        if len > 0.0001:
            return self / len
        return Self()

    @always_inline
    def lerp(self, to: Self, amount: Float32) -> Self:
        return self + (to - self) * amount

    @always_inline
    def min(self, other: Self) -> Self:
        return Self(
            min(self.x, other.x),
            min(self.y, other.y),
            min(self.z, other.z),
            min(self.w, other.w),
        )

    @always_inline
    def max(self, other: Self) -> Self:
        return Self(
            max(self.x, other.x),
            max(self.y, other.y),
            max(self.z, other.z),
            max(self.w, other.w),
        )

    # --- Operator Overloads ---
    @always_inline
    def __add__(self, other: Self) -> Self:
        return Self(
            self.x + other.x,
            self.y + other.y,
            self.z + other.z,
            self.w + other.w,
        )

    @always_inline
    def __add__(self, value: Float32) -> Self:
        return Self(
            self.x + value, self.y + value, self.z + value, self.w + value
        )

    @always_inline
    def __radd__(self, value: Float32) -> Self:
        return self + value

    @always_inline
    def __iadd__(mut self, other: Self):
        self.x += other.x
        self.y += other.y
        self.z += other.z
        self.w += other.w

    @always_inline
    def __iadd__(mut self, value: Float32):
        self.x += value
        self.y += value
        self.z += value
        self.w += value

    @always_inline
    def __sub__(self, other: Self) -> Self:
        return Self(
            self.x - other.x,
            self.y - other.y,
            self.z - other.z,
            self.w - other.w,
        )

    @always_inline
    def __sub__(self, value: Float32) -> Self:
        return Self(
            self.x - value, self.y - value, self.z - value, self.w - value
        )

    @always_inline
    def __rsub__(self, value: Float32) -> Self:
        return Self(
            value - self.x, value - self.y, value - self.z, value - self.w
        )

    @always_inline
    def __isub__(mut self, other: Self):
        self.x -= other.x
        self.y -= other.y
        self.z -= other.z
        self.w -= other.w

    @always_inline
    def __isub__(mut self, value: Float32):
        self.x -= value
        self.y -= value
        self.z -= value
        self.w -= value

    @always_inline
    def __mul__(self, s: Float32) -> Self:
        return Self(self.x * s, self.y * s, self.z * s, self.w * s)

    @always_inline
    def __mul__(self, other: Self) -> Self:
        return Self(
            self.x * other.x,
            self.y * other.y,
            self.z * other.z,
            self.w * other.w,
        )

    @always_inline
    def __rmul__(self, s: Float32) -> Self:
        return self * s

    @always_inline
    def __imul__(mut self, s: Float32):
        self.x *= s
        self.y *= s
        self.z *= s
        self.w *= s

    @always_inline
    def __imul__(mut self, other: Self):
        self.x *= other.x
        self.y *= other.y
        self.z *= other.z
        self.w *= other.w

    @always_inline
    def __truediv__(self, s: Float32) -> Self:
        return Self(self.x / s, self.y / s, self.z / s, self.w / s)

    @always_inline
    def __truediv__(self, other: Self) -> Self:
        return Self(
            self.x / other.x,
            self.y / other.y,
            self.z / other.z,
            self.w / other.w,
        )

    @always_inline
    def __itruediv__(mut self, s: Float32):
        self.x /= s
        self.y /= s
        self.z /= s
        self.w /= s

    @always_inline
    def __itruediv__(mut self, other: Self):
        self.x /= other.x
        self.y /= other.y
        self.z /= other.z
        self.w /= other.w

    @always_inline
    def __neg__(self) -> Self:
        return Self(-self.x, -self.y, -self.z, -self.w)

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return (
            self.x == other.x
            and self.y == other.y
            and self.z == other.z
            and self.w == other.w
        )

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)


struct Quaternion(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Quaternion type (4 float components)."""

    var x: Float32
    var y: Float32
    var z: Float32
    var w: Float32

    def __init__(
        out self,
        x: Float32 = 0.0,
        y: Float32 = 0.0,
        z: Float32 = 0.0,
        w: Float32 = 1.0,
    ):
        self.x = x
        self.y = y
        self.z = z
        self.w = w

    # --- Constructors & Factories ---
    @staticmethod
    @always_inline
    def identity() -> Self:
        return Self(0.0, 0.0, 0.0, 1.0)

    # --- Math Methods ---
    @always_inline
    def length(self) -> Float32:
        return sqrt(
            self.x * self.x
            + self.y * self.y
            + self.z * self.z
            + self.w * self.w
        )

    @always_inline
    def normalize(self) -> Self:
        var len = self.length()
        if len > 0.0001:
            return Self(self.x / len, self.y / len, self.z / len, self.w / len)
        return Self.identity()

    @always_inline
    def invert(self) -> Self:
        var len_sq = (
            self.x * self.x
            + self.y * self.y
            + self.z * self.z
            + self.w * self.w
        )
        if len_sq != 0.0:
            return Self(
                -self.x / len_sq,
                -self.y / len_sq,
                -self.z / len_sq,
                self.w / len_sq,
            )
        return Self()

    @always_inline
    def lerp(self, q2: Self, amount: Float32) -> Self:
        return (self + (q2 - self) * amount).normalize()

    # --- Operators ---
    @always_inline
    def __add__(self, other: Self) -> Self:
        return Self(
            self.x + other.x,
            self.y + other.y,
            self.z + other.z,
            self.w + other.w,
        )

    @always_inline
    def __sub__(self, other: Self) -> Self:
        return Self(
            self.x - other.x,
            self.y - other.y,
            self.z - other.z,
            self.w - other.w,
        )

    @always_inline
    def __mul__(self, s: Float32) -> Self:
        return Self(self.x * s, self.y * s, self.z * s, self.w * s)

    @always_inline
    def __mul__(self, q2: Self) -> Self:
        return Self(
            self.w * q2.x + self.x * q2.w + self.y * q2.z - self.z * q2.y,
            self.w * q2.y - self.x * q2.z + self.y * q2.w + self.z * q2.x,
            self.w * q2.z + self.x * q2.y - self.y * q2.x + self.z * q2.w,
            self.w * q2.w - self.x * q2.x - self.y * q2.y - self.z * q2.z,
        )

    @always_inline
    def __neg__(self) -> Self:
        return Self(-self.x, -self.y, -self.z, -self.w)

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return (
            self.x == other.x
            and self.y == other.y
            and self.z == other.z
            and self.w == other.w
        )

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)


struct Matrix(Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable):
    """Matrix 4x4 type (column-major layout)."""

    var m0: Float32
    var m4: Float32
    var m8: Float32
    var m12: Float32
    var m1: Float32
    var m5: Float32
    var m9: Float32
    var m13: Float32
    var m2: Float32
    var m6: Float32
    var m10: Float32
    var m14: Float32
    var m3: Float32
    var m7: Float32
    var m11: Float32
    var m15: Float32

    def __init__(out self):
        self.m0 = 1.0
        self.m4 = 0.0
        self.m8 = 0.0
        self.m12 = 0.0
        self.m1 = 0.0
        self.m5 = 1.0
        self.m9 = 0.0
        self.m13 = 0.0
        self.m2 = 0.0
        self.m6 = 0.0
        self.m10 = 1.0
        self.m14 = 0.0
        self.m3 = 0.0
        self.m7 = 0.0
        self.m11 = 0.0
        self.m15 = 1.0

    @staticmethod
    @always_inline
    def identity() -> Self:
        return Self()

    @always_inline
    def transpose(self) -> Self:
        var res = Self()
        res.m0 = self.m0
        res.m1 = self.m4
        res.m2 = self.m8
        res.m3 = self.m12
        res.m4 = self.m1
        res.m5 = self.m5
        res.m6 = self.m9
        res.m7 = self.m13
        res.m8 = self.m2
        res.m9 = self.m6
        res.m10 = self.m10
        res.m11 = self.m14
        res.m12 = self.m3
        res.m13 = self.m7
        res.m14 = self.m11
        res.m15 = self.m15
        return res

    @always_inline
    def __add__(self, right: Self) -> Self:
        var res = Self()
        res.m0 = self.m0 + right.m0
        res.m4 = self.m4 + right.m4
        res.m8 = self.m8 + right.m8
        res.m12 = self.m12 + right.m12
        res.m1 = self.m1 + right.m1
        res.m5 = self.m5 + right.m5
        res.m9 = self.m9 + right.m9
        res.m13 = self.m13 + right.m13
        res.m2 = self.m2 + right.m2
        res.m6 = self.m6 + right.m6
        res.m10 = self.m10 + right.m10
        res.m14 = self.m14 + right.m14
        res.m3 = self.m3 + right.m3
        res.m7 = self.m7 + right.m7
        res.m11 = self.m11 + right.m11
        res.m15 = self.m15 + right.m15
        return res

    @always_inline
    def __sub__(self, right: Self) -> Self:
        var res = Self()
        res.m0 = self.m0 - right.m0
        res.m4 = self.m4 - right.m4
        res.m8 = self.m8 - right.m8
        res.m12 = self.m12 - right.m12
        res.m1 = self.m1 - right.m1
        res.m5 = self.m5 - right.m5
        res.m9 = self.m9 - right.m9
        res.m13 = self.m13 - right.m13
        res.m2 = self.m2 - right.m2
        res.m6 = self.m6 - right.m6
        res.m10 = self.m10 - right.m10
        res.m14 = self.m14 - right.m14
        res.m3 = self.m3 - right.m3
        res.m7 = self.m7 - right.m7
        res.m11 = self.m11 - right.m11
        res.m15 = self.m15 - right.m15
        return res

    @always_inline
    def __mul__(self, right: Self) -> Self:
        var res = Self()
        res.m0 = (
            self.m0 * right.m0
            + self.m4 * right.m1
            + self.m8 * right.m2
            + self.m12 * right.m3
        )
        res.m1 = (
            self.m1 * right.m0
            + self.m5 * right.m1
            + self.m9 * right.m2
            + self.m13 * right.m3
        )
        res.m2 = (
            self.m2 * right.m0
            + self.m6 * right.m1
            + self.m10 * right.m2
            + self.m14 * right.m3
        )
        res.m3 = (
            self.m3 * right.m0
            + self.m7 * right.m1
            + self.m11 * right.m2
            + self.m15 * right.m3
        )

        res.m4 = (
            self.m0 * right.m4
            + self.m4 * right.m5
            + self.m8 * right.m6
            + self.m12 * right.m7
        )
        res.m5 = (
            self.m1 * right.m4
            + self.m5 * right.m5
            + self.m9 * right.m6
            + self.m13 * right.m7
        )
        res.m6 = (
            self.m2 * right.m4
            + self.m6 * right.m5
            + self.m10 * right.m6
            + self.m14 * right.m7
        )
        res.m7 = (
            self.m3 * right.m4
            + self.m7 * right.m5
            + self.m11 * right.m6
            + self.m15 * right.m7
        )

        res.m8 = (
            self.m0 * right.m8
            + self.m4 * right.m9
            + self.m8 * right.m10
            + self.m12 * right.m11
        )
        res.m9 = (
            self.m1 * right.m8
            + self.m5 * right.m9
            + self.m9 * right.m10
            + self.m13 * right.m11
        )
        res.m10 = (
            self.m2 * right.m8
            + self.m6 * right.m9
            + self.m10 * right.m10
            + self.m14 * right.m11
        )
        res.m11 = (
            self.m3 * right.m8
            + self.m7 * right.m9
            + self.m11 * right.m10
            + self.m15 * right.m11
        )

        res.m12 = (
            self.m0 * right.m12
            + self.m4 * right.m13
            + self.m8 * right.m14
            + self.m12 * right.m15
        )
        res.m13 = (
            self.m1 * right.m12
            + self.m5 * right.m13
            + self.m9 * right.m14
            + self.m13 * right.m15
        )
        res.m14 = (
            self.m2 * right.m12
            + self.m6 * right.m13
            + self.m10 * right.m14
            + self.m14 * right.m15
        )
        res.m15 = (
            self.m3 * right.m12
            + self.m7 * right.m13
            + self.m11 * right.m14
            + self.m15 * right.m15
        )
        return res

    @always_inline
    def __mul__(self, val: Float32) -> Self:
        var res = Self()
        res.m0 = self.m0 * val
        res.m4 = self.m4 * val
        res.m8 = self.m8 * val
        res.m12 = self.m12 * val
        res.m1 = self.m1 * val
        res.m5 = self.m5 * val
        res.m9 = self.m9 * val
        res.m13 = self.m13 * val
        res.m2 = self.m2 * val
        res.m6 = self.m6 * val
        res.m10 = self.m10 * val
        res.m14 = self.m14 * val
        res.m3 = self.m3 * val
        res.m7 = self.m7 * val
        res.m11 = self.m11 * val
        res.m15 = self.m15 * val
        return res

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return (
            self.m0 == other.m0
            and self.m4 == other.m4
            and self.m8 == other.m8
            and self.m12 == other.m12
            and self.m1 == other.m1
            and self.m5 == other.m5
            and self.m9 == other.m9
            and self.m13 == other.m13
            and self.m2 == other.m2
            and self.m6 == other.m6
            and self.m10 == other.m10
            and self.m14 == other.m14
            and self.m3 == other.m3
            and self.m7 == other.m7
            and self.m11 == other.m11
            and self.m15 == other.m15
        )

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)


struct Color(Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable):
    """Color RGBA type (4 unsigned byte components)."""

    var r: UInt8
    var g: UInt8
    var b: UInt8
    var a: UInt8

    def __init__(
        out self, r: UInt8 = 0, g: UInt8 = 0, b: UInt8 = 0, a: UInt8 = 255
    ):
        self.r = r
        self.g = g
        self.b = b
        self.a = a

    @always_inline
    def to_u32(self) -> UInt32:
        return (
            UInt32(self.r)
            | (UInt32(self.g) << 8)
            | (UInt32(self.b) << 16)
            | (UInt32(self.a) << 24)
        )

    @staticmethod
    @always_inline
    def from_u32(u: UInt32) -> Self:
        return Self(
            UInt8(u & 0xFF),
            UInt8((u >> 8) & 0xFF),
            UInt8((u >> 16) & 0xFF),
            UInt8((u >> 24) & 0xFF),
        )

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return (
            self.r == other.r
            and self.g == other.g
            and self.b == other.b
            and self.a == other.a
        )

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    @always_inline
    def alpha(self, alpha_factor: Float32) -> Self:
        var new_a = UInt8(min(max(alpha_factor * 255.0, 0.0), 255.0))
        return Self(self.r, self.g, self.b, new_a)

    @always_inline
    def to_vector4(self) -> Vector4:
        return Vector4(
            Float32(self.r) / 255.0,
            Float32(self.g) / 255.0,
            Float32(self.b) / 255.0,
            Float32(self.a) / 255.0,
        )

    @staticmethod
    @always_inline
    def from_vector4(v: Vector4) -> Self:
        return Self(
            UInt8(min(max(v.x * 255.0, 0.0), 255.0)),
            UInt8(min(max(v.y * 255.0, 0.0), 255.0)),
            UInt8(min(max(v.z * 255.0, 0.0), 255.0)),
            UInt8(min(max(v.w * 255.0, 0.0), 255.0)),
        )


struct Rectangle(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Rectangle type (position and size)."""

    var x: Float32
    var y: Float32
    var width: Float32
    var height: Float32

    def __init__(
        out self,
        x: Float32 = 0.0,
        y: Float32 = 0.0,
        width: Float32 = 0.0,
        height: Float32 = 0.0,
    ):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    @always_inline
    def __eq__(self, other: Self) -> Bool:
        return (
            self.x == other.x
            and self.y == other.y
            and self.width == other.width
            and self.height == other.height
        )

    @always_inline
    def __ne__(self, other: Self) -> Bool:
        return not (self == other)

    @always_inline
    def contains(self, point: Vector2) -> Bool:
        return (
            point.x >= self.x
            and point.x <= self.x + self.width
            and point.y >= self.y
            and point.y <= self.y + self.height
        )

    @always_inline
    def intersects(self, other: Self) -> Bool:
        return (
            (self.x < other.x + other.width)
            and (self.x + self.width > other.x)
            and (self.y < other.y + other.height)
            and (self.y + self.height > other.y)
        )

    @always_inline
    def get_position(self) -> Vector2:
        return Vector2(self.x, self.y)

    @always_inline
    def get_size(self) -> Vector2:
        return Vector2(self.width, self.height)


struct Image(ImplicitlyCopyable, TrivialRegisterPassable):
    """Image data type (RAM pixel data)."""

    var data: Int
    var width: Int32
    var height: Int32
    var mipmaps: Int32
    var format: Int32

    def __init__(out self):
        self.data = 0
        self.width = 0
        self.height = 0
        self.mipmaps = 0
        self.format = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String) -> Image:
        import raylib.c as c

        return c.LoadImage(file_name.unsafe_uint8_ptr())

    @staticmethod
    def gen_checked(
        width: Int32,
        height: Int32,
        checks_x: Int32,
        checks_y: Int32,
        col1: Color,
        col2: Color,
    ) -> Image:
        import raylib.c as c

        return c.GenImageChecked(width, height, checks_x, checks_y, col1, col2)

    @staticmethod
    def gen_color(width: Int32, height: Int32, color: Color) -> Image:
        import raylib.c as c

        return c.GenImageColor(width, height, color)

    def to_texture(self) -> Texture:
        import raylib.c as c

        return c.LoadTextureFromImage(self)

    def unload(self):
        import raylib.c as c

        c.UnloadImage(self)


struct Texture(ImplicitlyCopyable, TrivialRegisterPassable):
    """Texture2D data type (VRAM GPU texture)."""

    var id: UInt32
    var width: Int32
    var height: Int32
    var mipmaps: Int32
    var format: Int32

    def __init__(out self):
        self.id = 0
        self.width = 0
        self.height = 0
        self.mipmaps = 0
        self.format = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String) -> Texture:
        import raylib.c as c

        return c.LoadTexture(file_name.unsafe_uint8_ptr())

    @staticmethod
    def from_image(image: Image) -> Texture:
        import raylib.c as c

        return c.LoadTextureFromImage(image)

    def draw(
        self,
        posX: Int32,
        posY: Int32,
        tint: Color = Color(255, 255, 255, 255),
    ):
        import raylib.c as c

        c.DrawTexture(self, posX, posY, tint)

    def draw_v(
        self,
        position: Vector2,
        tint: Color = Color(255, 255, 255, 255),
    ):
        import raylib.c as c

        c.DrawTextureV(self, position, tint)

    def draw_ex(
        self,
        position: Vector2,
        rotation: Float32,
        scale: Float32,
        tint: Color = Color(255, 255, 255, 255),
    ):
        import raylib.c as c

        c.DrawTextureEx(self, position, rotation, scale, tint)

    def unload(self):
        import raylib.c as c

        c.UnloadTexture(self)


struct RenderTexture(ImplicitlyCopyable, TrivialRegisterPassable):
    """RenderTexture2D type (render target for 2D/3D)."""

    var id: UInt32
    var texture: Texture
    var depth: Texture

    def __init__(out self):
        self.id = 0
        self.texture = Texture()
        self.depth = Texture()


struct NPatchInfo(ImplicitlyCopyable, TrivialRegisterPassable):
    """NPatchInfo type (9-patch information)."""

    var source: Rectangle
    var left: Int32
    var top: Int32
    var right: Int32
    var bottom: Int32
    var layout: Int32

    def __init__(out self):
        self.source = Rectangle()
        self.left = 0
        self.top = 0
        self.right = 0
        self.bottom = 0
        self.layout = 0


struct GlyphInfo(ImplicitlyCopyable, TrivialRegisterPassable):
    """Font glyph info type."""

    var value: Int32
    var offsetX: Int32
    var offsetY: Int32
    var advanceX: Int32
    var image: Image

    def __init__(out self):
        self.value = 0
        self.offsetX = 0
        self.offsetY = 0
        self.advanceX = 0
        self.image = Image()


struct Font(ImplicitlyCopyable, TrivialRegisterPassable):
    """Font data type (includes texture and glyphs)."""

    var baseSize: Int32
    var glyphCount: Int32
    var glyphPadding: Int32
    var texture: Texture
    var recs: Int
    var glyphs: Int

    def __init__(out self):
        self.baseSize = 0
        self.glyphCount = 0
        self.glyphPadding = 0
        self.texture = Texture()
        self.recs = 0
        self.glyphs = 0


struct Camera3D(ImplicitlyCopyable, TrivialRegisterPassable):
    """Camera3D type (position, target, up, fovy, projection)."""

    var position: Vector3
    var target: Vector3
    var up: Vector3
    var fovy: Float32
    var projection: Int32

    def __init__(
        out self,
        position: Vector3 = Vector3(0.0, 0.0, 0.0),
        target: Vector3 = Vector3(0.0, 0.0, 0.0),
        up: Vector3 = Vector3(0.0, 1.0, 0.0),
        fovy: Float32 = 45.0,
        projection: Int32 = 0,
    ):
        self.position = position
        self.target = target
        self.up = up
        self.fovy = fovy
        self.projection = projection


struct Camera2D(ImplicitlyCopyable, TrivialRegisterPassable):
    """Camera2D type (offset, target, rotation, zoom)."""

    var offset: Vector2
    var target: Vector2
    var rotation: Float32
    var zoom: Float32

    def __init__(
        out self,
        offset: Vector2 = Vector2(0.0, 0.0),
        target: Vector2 = Vector2(0.0, 0.0),
        rotation: Float32 = 0.0,
        zoom: Float32 = 1.0,
    ):
        self.offset = offset
        self.target = target
        self.rotation = rotation
        self.zoom = zoom


struct Mesh(ImplicitlyCopyable, TrivialRegisterPassable):
    """Mesh type (vertex and triangle data)."""

    var vertexCount: Int32
    var triangleCount: Int32
    var vertices: Int
    var texcoords: Int
    var texcoords2: Int
    var normals: Int
    var tangents: Int
    var colors: Int
    var indices: Int
    var boneCount: Int32
    var boneIndices: Int
    var boneWeights: Int
    var animVertices: Int
    var animNormals: Int
    var vaoId: UInt32
    var vboId: Int

    def __init__(out self):
        self.vertexCount = 0
        self.triangleCount = 0
        self.vertices = 0
        self.texcoords = 0
        self.texcoords2 = 0
        self.normals = 0
        self.tangents = 0
        self.colors = 0
        self.indices = 0
        self.boneCount = 0
        self.boneIndices = 0
        self.boneWeights = 0
        self.animVertices = 0
        self.animNormals = 0
        self.vaoId = 0
        self.vboId = 0

    # --- Methods & Factories ---
    @staticmethod
    def gen_plane(
        width: Float32, length: Float32, res_x: Int32 = 2, res_z: Int32 = 2
    ) -> Mesh:
        import raylib.c as c

        return c.GenMeshPlane(width, length, res_x, res_z)

    @staticmethod
    def gen_cube(width: Float32, height: Float32, length: Float32) -> Mesh:
        import raylib.c as c

        return c.GenMeshCube(width, height, length)

    @staticmethod
    def gen_sphere(
        radius: Float32, rings: Int32 = 16, slices: Int32 = 16
    ) -> Mesh:
        import raylib.c as c

        return c.GenMeshSphere(radius, rings, slices)

    @staticmethod
    def gen_cylinder(
        radius: Float32, height: Float32, slices: Int32 = 16
    ) -> Mesh:
        import raylib.c as c

        return c.GenMeshCylinder(radius, height, slices)

    @staticmethod
    def gen_torus(
        radius: Float32, size: Float32, rad_seg: Int32 = 16, sides: Int32 = 16
    ) -> Mesh:
        import raylib.c as c

        return c.GenMeshTorus(radius, size, rad_seg, sides)

    @staticmethod
    def gen_knot(
        radius: Float32, size: Float32, rad_seg: Int32 = 16, sides: Int32 = 32
    ) -> Mesh:
        import raylib.c as c

        return c.GenMeshKnot(radius, size, rad_seg, sides)

    @staticmethod
    def gen_poly(sides: Int32, radius: Float32) -> Mesh:
        import raylib.c as c

        return c.GenMeshPoly(sides, radius)

    def to_model(self) -> Model:
        import raylib.c as c

        return c.LoadModelFromMesh(self)

    def draw(self, material: Material, transform: Matrix):
        import raylib.c as c

        c.DrawMesh(self, material, transform)

    def unload(self):
        import raylib.c as c

        c.UnloadMesh(self)


struct Shader(ImplicitlyCopyable, TrivialRegisterPassable):
    """Shader type (compiled shader program)."""

    var id: UInt32
    var locs: Int

    def __init__(out self):
        self.id = 0
        self.locs = 0


struct MaterialMap(ImplicitlyCopyable, TrivialRegisterPassable):
    """MaterialMap type (texture, color, value)."""

    var texture: Texture
    var color: Color
    var value: Float32

    def __init__(out self):
        self.texture = Texture()
        self.color = Color()
        self.value = 0.0


struct Material(ImplicitlyCopyable, TrivialRegisterPassable):
    """Material type (shader and material maps)."""

    var shader: Shader
    var maps: Int
    var param0: Float32
    var param1: Float32
    var param2: Float32
    var param3: Float32

    def __init__(out self):
        self.shader = Shader()
        self.maps = 0
        self.param0 = 0.0
        self.param1 = 0.0
        self.param2 = 0.0
        self.param3 = 0.0


struct ModelSkeleton(ImplicitlyCopyable, TrivialRegisterPassable):
    """ModelSkeleton type (bones hierarchy)."""

    var boneCount: Int32
    var bones: Int
    var bindPose: Int

    def __init__(out self):
        self.boneCount = 0
        self.bones = 0
        self.bindPose = 0


struct Model(ImplicitlyCopyable, TrivialRegisterPassable):
    """Model type (3D mesh and material hierarchy)."""

    var transform: Matrix
    var meshCount: Int32
    var materialCount: Int32
    var meshes: Int
    var materials: Int
    var meshMaterial: Int
    var skeleton: ModelSkeleton
    var currentPose: Int
    var boneMatrices: Int

    def __init__(out self):
        self.transform = Matrix()
        self.meshCount = 0
        self.materialCount = 0
        self.meshes = 0
        self.materials = 0
        self.meshMaterial = 0
        self.skeleton = ModelSkeleton()
        self.currentPose = 0
        self.boneMatrices = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String) -> Model:
        import raylib.c as c

        return c.LoadModel(file_name.unsafe_uint8_ptr())

    @staticmethod
    def from_mesh(mesh: Mesh) -> Model:
        import raylib.c as c

        return c.LoadModelFromMesh(mesh)

    def draw(
        self,
        position: Vector3 = Vector3(0.0, 0.0, 0.0),
        scale: Float32 = 1.0,
        tint: Color = Color(255, 255, 255, 255),
    ):
        import raylib.c as c

        c.DrawModel(self, position, scale, tint)

    def draw_wires(
        self,
        position: Vector3 = Vector3(0.0, 0.0, 0.0),
        scale: Float32 = 1.0,
        tint: Color = Color(80, 80, 80, 255),
    ):
        import raylib.c as c

        c.DrawModelWires(self, position, scale, tint)

    def draw_ex(
        self,
        position: Vector3,
        rotation_axis: Vector3,
        rotation_angle: Float32,
        scale: Vector3,
        tint: Color = Color(255, 255, 255, 255),
    ):
        import raylib.c as c

        c.DrawModelEx(
            self, position, rotation_axis, rotation_angle, scale, tint
        )

    def set_material_texture(self, map_type: Int32, texture: Texture):
        import raylib.c as c
        from std.origin import ImmutAnyOrigin
        from std.memory import Pointer

        c.SetMaterialTexture(
            Pointer[c.Material, origin=ImmutAnyOrigin](
                unsafe_from_address=self.materials
            ),
            map_type,
            texture,
        )

    def set_texture(self, texture: Texture):
        self.set_material_texture(0, texture)

    def update_animation(self, anim: ModelAnimation, frame: Int32):
        import raylib.c as c

        c.UpdateModelAnimation(self, anim, frame)

    def is_animation_valid(self, anim: ModelAnimation) -> Bool:
        import raylib.c as c

        return c.IsModelAnimationValid(self, anim)

    def unload(self):
        import raylib.c as c

        c.UnloadModel(self)


struct Ray(ImplicitlyCopyable, TrivialRegisterPassable):
    """Ray type (origin position and direction)."""

    var position: Vector3
    var direction: Vector3

    def __init__(
        out self,
        position: Vector3 = Vector3(),
        direction: Vector3 = Vector3(),
    ):
        self.position = position
        self.direction = direction


struct RayCollision(ImplicitlyCopyable, TrivialRegisterPassable):
    """RayCollision type (hit details)."""

    var hit: Bool
    var distance: Float32
    var point: Vector3
    var normal: Vector3

    def __init__(out self):
        self.hit = False
        self.distance = 0.0
        self.point = Vector3()
        self.normal = Vector3()


struct BoundingBox(ImplicitlyCopyable, TrivialRegisterPassable):
    """BoundingBox type (min and max Vector3 corners)."""

    var min: Vector3
    var max: Vector3

    def __init__(
        out self,
        min: Vector3 = Vector3(),
        max: Vector3 = Vector3(),
    ):
        self.min = min
        self.max = max


struct Wave(ImplicitlyCopyable, TrivialRegisterPassable):
    """Wave audio data type (PCM audio samples)."""

    var frameCount: UInt32
    var sampleRate: UInt32
    var sampleSize: UInt32
    var channels: UInt32
    var data: Int

    def __init__(out self):
        self.frameCount = 0
        self.sampleRate = 0
        self.sampleSize = 0
        self.channels = 0
        self.data = 0


struct AudioStream(ImplicitlyCopyable, TrivialRegisterPassable):
    """AudioStream type (raw audio stream buffer)."""

    var buffer: Int
    var processor: Int
    var sampleRate: UInt32
    var sampleSize: UInt32
    var channels: UInt32

    def __init__(out self):
        self.buffer = 0
        self.processor = 0
        self.sampleRate = 0
        self.sampleSize = 0
        self.channels = 0


struct Sound(ImplicitlyCopyable, TrivialRegisterPassable):
    """Sound audio source type."""

    var stream: AudioStream
    var frameCount: UInt32

    def __init__(out self):
        self.stream = AudioStream()
        self.frameCount = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String) -> Sound:
        import raylib.c as c

        return c.LoadSound(file_name.unsafe_uint8_ptr())

    def play(self):
        import raylib.c as c

        c.PlaySound(self)

    def stop(self):
        import raylib.c as c

        c.StopSound(self)

    def pause(self):
        import raylib.c as c

        c.PauseSound(self)

    def resume(self):
        import raylib.c as c

        c.ResumeSound(self)

    def is_playing(self) -> Bool:
        import raylib.c as c

        return c.IsSoundPlaying(self)

    def unload(self):
        import raylib.c as c

        c.UnloadSound(self)


struct Music(ImplicitlyCopyable, TrivialRegisterPassable):
    """Music audio stream type."""

    var stream: AudioStream
    var frameCount: UInt32
    var looping: Bool
    var ctxType: Int32
    var ctxData: Int

    def __init__(out self):
        self.stream = AudioStream()
        self.frameCount = 0
        self.looping = False
        self.ctxType = 0
        self.ctxData = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String) -> Music:
        import raylib.c as c

        return c.LoadMusicStream(file_name.unsafe_uint8_ptr())

    def play(self):
        import raylib.c as c

        c.PlayMusicStream(self)

    def stop(self):
        import raylib.c as c

        c.StopMusicStream(self)

    def pause(self):
        import raylib.c as c

        c.PauseMusicStream(self)

    def resume(self):
        import raylib.c as c

        c.ResumeMusicStream(self)

    def is_playing(self) -> Bool:
        import raylib.c as c

        return c.IsMusicStreamPlaying(self)

    def update(self):
        import raylib.c as c

        c.UpdateMusicStream(self)

    def unload(self):
        import raylib.c as c

        c.UnloadMusicStream(self)


struct Transform(
    Equatable, ImplicitlyCopyable, TrivialRegisterPassable, Writable
):
    """Transform, vertex transformation data."""

    var translation: Vector3
    var rotation: Quaternion
    var scale: Vector3

    def __init__(
        out self,
        translation: Vector3 = Vector3(),
        rotation: Quaternion = Quaternion(0.0, 0.0, 0.0, 1.0),
        scale: Vector3 = Vector3(1.0, 1.0, 1.0),
    ):
        self.translation = translation
        self.rotation = rotation
        self.scale = scale

    @staticmethod
    @always_inline
    def identity() -> Self:
        return Self(
            Vector3(), Quaternion(0.0, 0.0, 0.0, 1.0), Vector3(1.0, 1.0, 1.0)
        )

    @always_inline
    def translate(self, delta: Vector3) -> Self:
        return Self(self.translation + delta, self.rotation, self.scale)

    @always_inline
    def scale_by(self, factor: Float32) -> Self:
        return Self(self.translation, self.rotation, self.scale * factor)

    @always_inline
    def write_to[W: Writer](self, mut writer: W):
        writer.write(
            "Transform(translation=",
            self.translation,
            ", rotation=",
            self.rotation,
            ", scale=",
            self.scale,
            ")",
        )


struct BoneInfo(ImplicitlyCopyable, TrivialRegisterPassable):
    """BoneInfo, skeletal animation bone."""

    var name0: UInt64
    var name1: UInt64
    var name2: UInt64
    var name3: UInt64
    var parent: Int32

    def __init__(out self):
        self.name0 = 0
        self.name1 = 0
        self.name2 = 0
        self.name3 = 0
        self.parent = 0


struct ModelAnimation(ImplicitlyCopyable, TrivialRegisterPassable):
    """ModelAnimation, contains a full animation sequence."""

    var name0: UInt64
    var name1: UInt64
    var name2: UInt64
    var name3: UInt64
    var boneCount: Int32
    var keyframeCount: Int32
    var keyframePoses: Int

    def __init__(out self):
        self.name0 = 0
        self.name1 = 0
        self.name2 = 0
        self.name3 = 0
        self.boneCount = 0
        self.keyframeCount = 0
        self.keyframePoses = 0

    # --- Methods & Factories ---
    def update(self, model: Model, frame: Int32):
        import raylib.c as c

        c.UpdateModelAnimation(model, self, frame)

    def is_valid(self, model: Model) -> Bool:
        import raylib.c as c

        return c.IsModelAnimationValid(model, self)

    def unload(self):
        import raylib.c as c

        c.UnloadModelAnimation(self)


struct VrDeviceInfo(ImplicitlyCopyable, TrivialRegisterPassable):
    """VrDeviceInfo, Head-Mounted-Display device parameters."""

    var hResolution: Int32
    var vResolution: Int32
    var hScreenSize: Float32
    var vScreenSize: Float32
    var eyeToScreenDistance: Float32
    var lensSeparationDistance: Float32
    var interpupillaryDistance: Float32
    var lensDistortionValue0: Float32
    var lensDistortionValue1: Float32
    var lensDistortionValue2: Float32
    var lensDistortionValue3: Float32
    var chromaAbCorrection0: Float32
    var chromaAbCorrection1: Float32
    var chromaAbCorrection2: Float32
    var chromaAbCorrection3: Float32

    def __init__(out self):
        self.hResolution = 0
        self.vResolution = 0
        self.hScreenSize = 0.0
        self.vScreenSize = 0.0
        self.eyeToScreenDistance = 0.0
        self.lensSeparationDistance = 0.0
        self.interpupillaryDistance = 0.0
        self.lensDistortionValue0 = 0.0
        self.lensDistortionValue1 = 0.0
        self.lensDistortionValue2 = 0.0
        self.lensDistortionValue3 = 0.0
        self.chromaAbCorrection0 = 0.0
        self.chromaAbCorrection1 = 0.0
        self.chromaAbCorrection2 = 0.0
        self.chromaAbCorrection3 = 0.0


struct VrStereoConfig(ImplicitlyCopyable, TrivialRegisterPassable):
    """VrStereoConfig, VR stereo rendering configuration."""

    var projectionLeft: Matrix
    var projectionRight: Matrix
    var viewOffsetLeft: Matrix
    var viewOffsetRight: Matrix
    var leftLensCenter0: Float32
    var leftLensCenter1: Float32
    var rightLensCenter0: Float32
    var rightLensCenter1: Float32
    var leftScreenCenter0: Float32
    var leftScreenCenter1: Float32
    var rightScreenCenter0: Float32
    var rightScreenCenter1: Float32
    var scale0: Float32
    var scale1: Float32
    var scaleIn0: Float32
    var scaleIn1: Float32

    def __init__(out self):
        self.projectionLeft = Matrix()
        self.projectionRight = Matrix()
        self.viewOffsetLeft = Matrix()
        self.viewOffsetRight = Matrix()
        self.leftLensCenter0 = 0.0
        self.leftLensCenter1 = 0.0
        self.rightLensCenter0 = 0.0
        self.rightLensCenter1 = 0.0
        self.leftScreenCenter0 = 0.0
        self.leftScreenCenter1 = 0.0
        self.rightScreenCenter0 = 0.0
        self.rightScreenCenter1 = 0.0
        self.scale0 = 0.0
        self.scale1 = 0.0
        self.scaleIn0 = 0.0
        self.scaleIn1 = 0.0


struct FilePathList(ImplicitlyCopyable, TrivialRegisterPassable):
    """FilePathList type."""

    var count: UInt32
    var capacity: UInt32
    var paths: Int

    def __init__(out self):
        self.count = 0
        self.capacity = 0
        self.paths = 0

    # --- Methods & Factories ---
    @staticmethod
    def load_directory(dir_path: String) -> FilePathList:
        import raylib.c as c

        return c.LoadDirectoryFiles(dir_path.unsafe_uint8_ptr())

    @staticmethod
    def load_dropped() -> FilePathList:
        import raylib.c as c

        return c.LoadDroppedFiles()

    def unload(self):
        import raylib.c as c

        c.UnloadFilePathList(self)

    def __len__(self) -> Int:
        return Int(self.count)


struct AutomationEvent(ImplicitlyCopyable, TrivialRegisterPassable):
    """AutomationEvent type."""

    var frame: UInt32
    var type: UInt32
    var param0: Int32
    var param1: Int32
    var param2: Int32
    var param3: Int32

    def __init__(out self):
        self.frame = 0
        self.type = 0
        self.param0 = 0
        self.param1 = 0
        self.param2 = 0
        self.param3 = 0


struct AutomationEventList(ImplicitlyCopyable, TrivialRegisterPassable):
    """AutomationEventList type."""

    var capacity: UInt32
    var count: UInt32
    var events: Int

    def __init__(out self):
        self.capacity = 0
        self.count = 0
        self.events = 0

    # --- Methods & Factories ---
    @staticmethod
    def load(file_name: String = "") -> AutomationEventList:
        import raylib.c as c
        from std.origin import ImmutAnyOrigin
        from std.memory import Pointer

        if len(file_name) == 0:
            return c.LoadAutomationEventList(
                Pointer[UInt8, origin=ImmutAnyOrigin]()
            )
        return c.LoadAutomationEventList(file_name.unsafe_uint8_ptr())

    def unload(self):
        import raylib.c as c

        c.UnloadAutomationEventList(self)

    def __len__(self) -> Int:
        return Int(self.count)

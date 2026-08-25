"""Unit tests for Raylib Mojo primitive math types."""

from std.testing import assert_equal, assert_true, assert_false, TestSuite
from raylib.types import (
    Vector2,
    Vector3,
    Vector4,
    Quaternion,
    Matrix,
    Color,
    Rectangle,
)


def test_vector2() raises:
    var v1 = Vector2(3.0, 4.0)
    var v2 = Vector2(1.0, 2.0)

    # Addition & Subtraction
    assert_equal(v1 + v2, Vector2(4.0, 6.0))
    assert_equal(v1 - v2, Vector2(2.0, 2.0))

    # Scalar multiplication & division
    assert_equal(v1 * 2.0, Vector2(6.0, 8.0))
    assert_equal(v1 / 2.0, Vector2(1.5, 2.0))

    # Dot & Cross product
    assert_equal(v1.dot(v2), 11.0)
    assert_equal(v1.cross(v2), 2.0)

    # Length & Distance
    assert_equal(v1.length_sqr(), 25.0)
    assert_equal(v1.length(), 5.0)
    assert_equal(v1.distance(Vector2(0.0, 0.0)), 5.0)

    # In-place operators
    var v3 = Vector2(2.0, 3.0)
    v3 += Vector2(1.0, 1.0)
    assert_equal(v3, Vector2(3.0, 4.0))

    v3 *= 2.0
    assert_equal(v3, Vector2(6.0, 8.0))


def test_vector3() raises:
    var v1 = Vector3(1.0, 2.0, 3.0)
    var v2 = Vector3(4.0, 5.0, 6.0)

    # Addition & Subtraction
    assert_equal(v1 + v2, Vector3(5.0, 7.0, 9.0))
    assert_equal(v2 - v1, Vector3(3.0, 3.0, 3.0))

    # Cross product: (2*6 - 3*5, 3*4 - 1*6, 1*5 - 2*4) = (-3, 6, -3)
    assert_equal(v1.cross(v2), Vector3(-3.0, 6.0, -3.0))

    # Dot product: 1*4 + 2*5 + 3*6 = 32
    assert_equal(v1.dot(v2), 32.0)

    # In-place operators
    var v3 = Vector3(1.0, 1.0, 1.0)
    v3 *= 3.0
    assert_equal(v3, Vector3(3.0, 3.0, 3.0))


def test_vector4() raises:
    var v1 = Vector4(1.0, 2.0, 3.0, 4.0)
    var v2 = Vector4(2.0, 2.0, 2.0, 2.0)

    assert_equal(v1 + v2, Vector4(3.0, 4.0, 5.0, 6.0))
    assert_equal(v1.dot(v2), 20.0)


def test_matrix() raises:
    var m1 = Matrix.identity()
    var m2 = Matrix.identity()
    var m_sum = m1 + m2
    assert_equal(m_sum.m0, 2.0)
    assert_equal(m_sum.m5, 2.0)

    # Matrix multiplication with identity
    var m_prod = m1 * m2
    assert_equal(m_prod, m1)


def test_quaternion() raises:
    var q1 = Quaternion.identity()
    assert_equal(q1.length(), 1.0)


def test_color() raises:
    var c1 = Color(255, 0, 0, 255)
    var c2 = Color(255, 0, 0, 255)
    var c3 = Color(0, 255, 0, 255)
    assert_equal(c1, c2)
    assert_true(c1 != c3)

    var v4 = c1.to_vector4()
    assert_equal(v4, Vector4(1.0, 0.0, 0.0, 1.0))


def test_rectangle() raises:
    var r1 = Rectangle(0.0, 0.0, 100.0, 100.0)
    var p_inside = Vector2(50.0, 50.0)
    var p_outside = Vector2(150.0, 150.0)
    assert_true(r1.contains(p_inside))
    assert_false(r1.contains(p_outside))

    var r2 = Rectangle(50.0, 50.0, 100.0, 100.0)
    assert_true(r1.intersects(r2))


def main() raises:
    TestSuite.discover_tests[__functions_in_module()]().run()

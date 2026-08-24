"""Gestures processing API for Raylib in Mojo."""

from raylib.types import Vector2
import raylib.c_gestures as c_gestures

comptime GESTURE_NONE: UInt32 = 0
comptime GESTURE_TAP: UInt32 = 1
comptime GESTURE_DOUBLETAP: UInt32 = 2
comptime GESTURE_HOLD: UInt32 = 4
comptime GESTURE_DRAG: UInt32 = 8
comptime GESTURE_SWIPE_RIGHT: UInt32 = 16
comptime GESTURE_SWIPE_LEFT: UInt32 = 32
comptime GESTURE_SWIPE_UP: UInt32 = 64
comptime GESTURE_SWIPE_DOWN: UInt32 = 128
comptime GESTURE_PINCH_IN: UInt32 = 256
comptime GESTURE_PINCH_OUT: UInt32 = 512


def set_gestures_enabled(flags: UInt32):
    """Enable a set of gestures using flags."""
    c_gestures.SetGesturesEnabled(flags)


def is_gesture_detected(gesture: UInt32) -> Bool:
    """Check if gesture has been detected."""
    return c_gestures.IsGestureDetected(gesture)


def get_gesture_detected() -> Int32:
    """Get latest detected gesture."""
    return c_gestures.GetGestureDetected()


def get_gesture_hold_duration() -> Float32:
    """Get gesture hold time in seconds."""
    return c_gestures.GetGestureHoldDuration()


def get_gesture_drag_vector() -> Vector2:
    """Get gesture drag vector."""
    return c_gestures.GetGestureDragVector()


def get_gesture_drag_angle() -> Float32:
    """Get gesture drag angle."""
    return c_gestures.GetGestureDragAngle()


def get_gesture_pinch_vector() -> Vector2:
    """Get gesture pinch delta."""
    return c_gestures.GetGesturePinchVector()


def get_gesture_pinch_angle() -> Float32:
    """Get gesture pinch angle."""
    return c_gestures.GetGesturePinchAngle()

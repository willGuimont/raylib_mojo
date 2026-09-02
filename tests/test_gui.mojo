"""Unit tests for Raylib Mojo Raygui bindings and struct wrappers."""

from std.testing import assert_equal, assert_true, assert_false, TestSuite
from raylib.types import Rectangle, Color
from raylib.gui import (
    Gui,
    GuiCheckBox,
    GuiSlider,
    GuiSpinner,
    GuiValueBox,
    GuiToggleGroup,
    GuiComboBox,
    GuiDropdownBox,
    GuiColorPicker,
    gui_lock,
    gui_unlock,
    gui_is_locked,
    gui_set_alpha,
    gui_set_state,
    gui_get_state,
)
from raylib.gui_enums import (
    STATE_NORMAL,
    STATE_DISABLED,
    DEFAULT,
    TEXT_SIZE,
)


def test_gui_global_state() raises:
    gui_unlock()
    assert_false(gui_is_locked())
    gui_lock()
    assert_true(gui_is_locked())
    gui_unlock()
    assert_false(gui_is_locked())

    gui_set_state(STATE_NORMAL)
    assert_equal(gui_get_state(), STATE_NORMAL)
    gui_set_state(STATE_DISABLED)
    assert_equal(gui_get_state(), STATE_DISABLED)
    gui_set_state(STATE_NORMAL)

    gui_set_alpha(0.8)
    gui_set_alpha(1.0)


def test_gui_style_get_set() raises:
    Gui.set_style(DEFAULT, TEXT_SIZE, 16)
    assert_equal(Gui.get_style(DEFAULT, TEXT_SIZE), 16)
    Gui.set_style(DEFAULT, TEXT_SIZE, 20)
    assert_equal(Gui.get_style(DEFAULT, TEXT_SIZE), 20)
    Gui.set_style(DEFAULT, TEXT_SIZE, 16)


def test_gui_struct_wrappers() raises:
    var chk = GuiCheckBox(Rectangle(10, 10, 20, 20), "Test Checkbox", True)
    assert_equal(chk.checked, True)
    assert_equal(chk.text, "Test Checkbox")

    var slider = GuiSlider(
        Rectangle(10, 40, 120, 20), "Min", "Max", 0.5, 0.0, 1.0
    )
    assert_equal(slider.value, 0.5)

    var spinner = GuiSpinner(
        Rectangle(10, 70, 100, 20), "Count", 5, 0, 10, False
    )
    assert_equal(spinner.value, 5)

    var valbox = GuiValueBox(
        Rectangle(10, 100, 100, 20), "Val", 42, 0, 100, False
    )
    assert_equal(valbox.value, 42)

    var toggles = GuiToggleGroup(
        Rectangle(10, 130, 200, 24), "Option A;Option B;Option C", 1
    )
    assert_equal(toggles.active, 1)

    var combo = GuiComboBox(
        Rectangle(10, 160, 150, 24), "Item 1;Item 2;Item 3", 0
    )
    assert_equal(combo.active, 0)

    var dropdown = GuiDropdownBox(
        Rectangle(10, 190, 150, 24), "One;Two;Three", 2, False
    )
    assert_equal(dropdown.active, 2)
    assert_false(dropdown.edit_mode)

    var cp = GuiColorPicker(
        Rectangle(10, 220, 100, 100), "Color", Color(255, 0, 0, 255)
    )
    assert_equal(cp.color.r, 255)


def main() raises:
    TestSuite.discover_tests[__functions_in_module()]().run()

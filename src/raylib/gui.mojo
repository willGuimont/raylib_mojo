"""High-level Mojo API and struct wrappers for Raygui."""

from std.memory import Pointer
from std.origin import ImmutAnyOrigin
from raylib.types import Rectangle, Vector2, Color, Font
from raylib import c_gui


# ============================================================================
# Procedural Functions
# ============================================================================


def gui_enable():
    """Enable gui controls (global state)."""
    c_gui.GuiEnable()


def gui_disable():
    """Disable gui controls (global state)."""
    c_gui.GuiDisable()


def gui_lock():
    """Lock gui controls (global state)."""
    c_gui.GuiLock()


def gui_unlock():
    """Unlock gui controls (global state)."""
    c_gui.GuiUnlock()


def gui_is_locked() -> Bool:
    """Check if gui is locked (global state)."""
    return c_gui.GuiIsLocked()


def gui_set_alpha(alpha: Float32):
    """Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f."""
    c_gui.GuiSetAlpha(alpha)


def gui_set_state(state: Int32):
    """Set gui state (global state)."""
    c_gui.GuiSetState(state)


def gui_get_state() -> Int32:
    """Get gui state (global state)."""
    return c_gui.GuiGetState()


def gui_set_font(font: Font):
    """Set gui custom font (global state)."""
    c_gui.GuiSetFont(font)


def gui_get_font() -> Font:
    """Get gui custom font (global state)."""
    return c_gui.GuiGetFont()


def gui_set_style(control: Int32, property: Int32, value: Int32):
    """Set one style property."""
    c_gui.GuiSetStyle(control, property, value)


def gui_get_style(control: Int32, property: Int32) -> Int32:
    """Get one style property."""
    return c_gui.GuiGetStyle(control, property)


def gui_load_style(file_name: String):
    """Load style file over global style variable (.rgs)."""
    var buf = file_name + "\0"
    c_gui.GuiLoadStyle(rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()))


def gui_load_style_default():
    """Load default style over global style."""
    c_gui.GuiLoadStyleDefault()


def gui_enable_tooltip():
    """Enable gui tooltips (global state)."""
    c_gui.GuiEnableTooltip()


def gui_disable_tooltip():
    """Disable gui tooltips (global state)."""
    c_gui.GuiDisableTooltip()


def gui_set_tooltip(tooltip: String):
    """Set tooltip string."""
    var buf = tooltip + "\0"
    c_gui.GuiSetTooltip(
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_draw_icon(
    icon_id: Int32, pos_x: Int32, pos_y: Int32, pixel_size: Int32, color: Color
):
    """Draw icon using pixel size at specified position."""
    c_gui.GuiDrawIcon(icon_id, pos_x, pos_y, pixel_size, color)


def gui_get_text_width(text: String) -> Int32:
    """Get text width considering gui style and icon size (if required)."""
    var buf = text + "\0"
    return c_gui.GuiGetTextWidth(
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_window_box(bounds: Rectangle, title: String) -> Int32:
    """Window Box control, shows a window that can be closed. Returns 1 if close button clicked.
    """
    var buf = title + "\0"
    return c_gui.GuiWindowBox(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_group_box(bounds: Rectangle, text: String) -> Int32:
    """Group Box control with text name."""
    var buf = text + "\0"
    return c_gui.GuiGroupBox(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_line(bounds: Rectangle, text: String) -> Int32:
    """Line separator control, could contain text."""
    var buf = text + "\0"
    return c_gui.GuiLine(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_panel(bounds: Rectangle, text: String) -> Int32:
    """Panel control, useful to group controls."""
    var buf = text + "\0"
    return c_gui.GuiPanel(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_label(bounds: Rectangle, text: String) -> Int32:
    """Label control."""
    var buf = text + "\0"
    return c_gui.GuiLabel(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_button(bounds: Rectangle, text: String) -> Bool:
    """Button control, returns True when clicked."""
    var buf = text + "\0"
    return (
        c_gui.GuiButton(
            bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
        )
        != 0
    )


def gui_label_button(bounds: Rectangle, text: String) -> Bool:
    """Label button control, returns True when clicked."""
    var buf = text + "\0"
    return (
        c_gui.GuiLabelButton(
            bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
        )
        != 0
    )


def gui_toggle(bounds: Rectangle, text: String, mut active: Bool) -> Bool:
    """Toggle Button control. Mutates active state."""
    var buf = text + "\0"
    var act_ptr = Pointer(to=active)
    var res = c_gui.GuiToggle(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Bool, ImmutAnyOrigin]](act_ptr),
    )
    return res != 0


def gui_toggle_group(
    bounds: Rectangle, text: String, mut active: Int32
) -> Int32:
    """Toggle Group control."""
    var buf = text + "\0"
    var act_ptr = Pointer(to=active)
    return c_gui.GuiToggleGroup(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](act_ptr),
    )


def gui_toggle_slider(
    bounds: Rectangle, text: String, mut active: Int32
) -> Int32:
    """Toggle Slider control."""
    var buf = text + "\0"
    var act_ptr = Pointer(to=active)
    return c_gui.GuiToggleSlider(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](act_ptr),
    )


def gui_check_box(bounds: Rectangle, text: String, mut checked: Bool) -> Bool:
    """Check Box control, returns True when active."""
    var buf = text + "\0"
    var chk_ptr = Pointer(to=checked)
    var res = c_gui.GuiCheckBox(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Bool, ImmutAnyOrigin]](chk_ptr),
    )
    return res != 0


def gui_combo_box(bounds: Rectangle, text: String, mut active: Int32) -> Int32:
    """Combo Box control."""
    var buf = text + "\0"
    var act_ptr = Pointer(to=active)
    return c_gui.GuiComboBox(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](act_ptr),
    )


def gui_dropdown_box(
    bounds: Rectangle, text: String, mut active: Int32, edit_mode: Bool
) -> Int32:
    """Dropdown Box control."""
    var buf = text + "\0"
    var act_ptr = Pointer(to=active)
    return c_gui.GuiDropdownBox(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](act_ptr),
        edit_mode,
    )


def gui_spinner(
    bounds: Rectangle,
    text: String,
    mut value: Int32,
    min_value: Int32,
    max_value: Int32,
    edit_mode: Bool,
) -> Int32:
    """Spinner control."""
    var buf = text + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiSpinner(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](val_ptr),
        min_value,
        max_value,
        edit_mode,
    )


def gui_value_box(
    bounds: Rectangle,
    text: String,
    mut value: Int32,
    min_value: Int32,
    max_value: Int32,
    edit_mode: Bool,
) -> Int32:
    """Value Box control, updates input text with numbers."""
    var buf = text + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiValueBox(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Int32, ImmutAnyOrigin]](val_ptr),
        min_value,
        max_value,
        edit_mode,
    )


def gui_slider(
    bounds: Rectangle,
    text_left: String,
    text_right: String,
    mut value: Float32,
    min_value: Float32,
    max_value: Float32,
) -> Int32:
    """Slider control."""
    var l_buf = text_left + "\0"
    var r_buf = text_right + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiSlider(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](l_buf.unsafe_ptr()),
        rebind[Pointer[UInt8, ImmutAnyOrigin]](r_buf.unsafe_ptr()),
        rebind[Pointer[Float32, ImmutAnyOrigin]](val_ptr),
        min_value,
        max_value,
    )


def gui_slider_bar(
    bounds: Rectangle,
    text_left: String,
    text_right: String,
    mut value: Float32,
    min_value: Float32,
    max_value: Float32,
) -> Int32:
    """Slider Bar control."""
    var l_buf = text_left + "\0"
    var r_buf = text_right + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiSliderBar(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](l_buf.unsafe_ptr()),
        rebind[Pointer[UInt8, ImmutAnyOrigin]](r_buf.unsafe_ptr()),
        rebind[Pointer[Float32, ImmutAnyOrigin]](val_ptr),
        min_value,
        max_value,
    )


def gui_progress_bar(
    bounds: Rectangle,
    text_left: String,
    text_right: String,
    mut value: Float32,
    min_value: Float32,
    max_value: Float32,
) -> Int32:
    """Progress Bar control."""
    var l_buf = text_left + "\0"
    var r_buf = text_right + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiProgressBar(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](l_buf.unsafe_ptr()),
        rebind[Pointer[UInt8, ImmutAnyOrigin]](r_buf.unsafe_ptr()),
        rebind[Pointer[Float32, ImmutAnyOrigin]](val_ptr),
        min_value,
        max_value,
    )


def gui_status_bar(bounds: Rectangle, text: String) -> Int32:
    """Status Bar control, shows info text."""
    var buf = text + "\0"
    return c_gui.GuiStatusBar(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_dummy_rec(bounds: Rectangle, text: String) -> Int32:
    """Dummy rectangle control, shows bounds grid."""
    var buf = text + "\0"
    return c_gui.GuiDummyRec(
        bounds, rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr())
    )


def gui_color_picker(
    bounds: Rectangle, text: String, mut color: Color
) -> Int32:
    """Color Picker control."""
    var buf = text + "\0"
    var clr_ptr = Pointer(to=color)
    return c_gui.GuiColorPicker(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Color, ImmutAnyOrigin]](clr_ptr),
    )


def gui_color_panel(bounds: Rectangle, text: String, mut color: Color) -> Int32:
    """Color Panel control."""
    var buf = text + "\0"
    var clr_ptr = Pointer(to=color)
    return c_gui.GuiColorPanel(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Color, ImmutAnyOrigin]](clr_ptr),
    )


def gui_color_bar_alpha(
    bounds: Rectangle, text: String, mut alpha: Float32
) -> Int32:
    """Color Bar Alpha control."""
    var buf = text + "\0"
    var a_ptr = Pointer(to=alpha)
    return c_gui.GuiColorBarAlpha(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Float32, ImmutAnyOrigin]](a_ptr),
    )


def gui_color_bar_hue(
    bounds: Rectangle, text: String, mut value: Float32
) -> Int32:
    """Color Bar Hue control."""
    var buf = text + "\0"
    var val_ptr = Pointer(to=value)
    return c_gui.GuiColorBarHue(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](buf.unsafe_ptr()),
        rebind[Pointer[Float32, ImmutAnyOrigin]](val_ptr),
    )


def gui_message_box(
    bounds: Rectangle, title: String, message: String, buttons: String
) -> Int32:
    """Message Box control, displays a message and buttons."""
    var t_buf = title + "\0"
    var m_buf = message + "\0"
    var b_buf = buttons + "\0"
    return c_gui.GuiMessageBox(
        bounds,
        rebind[Pointer[UInt8, ImmutAnyOrigin]](t_buf.unsafe_ptr()),
        rebind[Pointer[UInt8, ImmutAnyOrigin]](m_buf.unsafe_ptr()),
        rebind[Pointer[UInt8, ImmutAnyOrigin]](b_buf.unsafe_ptr()),
    )


# ============================================================================
# Unified `Gui` Struct (Static Method Namespace)
# ============================================================================


@fieldwise_init
struct Gui(Copyable, Movable):
    """Unified Gui namespace providing static helper methods for all Raygui controls.
    """

    @staticmethod
    def enable():
        gui_enable()

    @staticmethod
    def disable():
        gui_disable()

    @staticmethod
    def lock():
        gui_lock()

    @staticmethod
    def unlock():
        gui_unlock()

    @staticmethod
    def is_locked() -> Bool:
        return gui_is_locked()

    @staticmethod
    def set_alpha(alpha: Float32):
        gui_set_alpha(alpha)

    @staticmethod
    def set_state(state: Int32):
        gui_set_state(state)

    @staticmethod
    def get_state() -> Int32:
        return gui_get_state()

    @staticmethod
    def set_font(font: Font):
        gui_set_font(font)

    @staticmethod
    def get_font() -> Font:
        return gui_get_font()

    @staticmethod
    def set_style(control: Int32, property: Int32, value: Int32):
        gui_set_style(control, property, value)

    @staticmethod
    def get_style(control: Int32, property: Int32) -> Int32:
        return gui_get_style(control, property)

    @staticmethod
    def load_style(file_name: String):
        gui_load_style(file_name)

    @staticmethod
    def load_style_default():
        gui_load_style_default()

    @staticmethod
    def draw_icon(
        icon_id: Int32,
        pos_x: Int32,
        pos_y: Int32,
        pixel_size: Int32,
        color: Color,
    ):
        gui_draw_icon(icon_id, pos_x, pos_y, pixel_size, color)

    @staticmethod
    def window_box(bounds: Rectangle, title: String) -> Int32:
        return gui_window_box(bounds, title)

    @staticmethod
    def group_box(bounds: Rectangle, text: String) -> Int32:
        return gui_group_box(bounds, text)

    @staticmethod
    def line(bounds: Rectangle, text: String) -> Int32:
        return gui_line(bounds, text)

    @staticmethod
    def panel(bounds: Rectangle, text: String) -> Int32:
        return gui_panel(bounds, text)

    @staticmethod
    def label(bounds: Rectangle, text: String) -> Int32:
        return gui_label(bounds, text)

    @staticmethod
    def button(bounds: Rectangle, text: String) -> Bool:
        return gui_button(bounds, text)

    @staticmethod
    def label_button(bounds: Rectangle, text: String) -> Bool:
        return gui_label_button(bounds, text)

    @staticmethod
    def toggle(bounds: Rectangle, text: String, mut active: Bool) -> Bool:
        return gui_toggle(bounds, text, active)

    @staticmethod
    def toggle_group(
        bounds: Rectangle, text: String, mut active: Int32
    ) -> Int32:
        return gui_toggle_group(bounds, text, active)

    @staticmethod
    def check_box(bounds: Rectangle, text: String, mut checked: Bool) -> Bool:
        return gui_check_box(bounds, text, checked)

    @staticmethod
    def combo_box(bounds: Rectangle, text: String, mut active: Int32) -> Int32:
        return gui_combo_box(bounds, text, active)

    @staticmethod
    def dropdown_box(
        bounds: Rectangle, text: String, mut active: Int32, edit_mode: Bool
    ) -> Int32:
        return gui_dropdown_box(bounds, text, active, edit_mode)

    @staticmethod
    def spinner(
        bounds: Rectangle,
        text: String,
        mut value: Int32,
        min_value: Int32,
        max_value: Int32,
        edit_mode: Bool,
    ) -> Int32:
        return gui_spinner(bounds, text, value, min_value, max_value, edit_mode)

    @staticmethod
    def value_box(
        bounds: Rectangle,
        text: String,
        mut value: Int32,
        min_value: Int32,
        max_value: Int32,
        edit_mode: Bool,
    ) -> Int32:
        return gui_value_box(
            bounds, text, value, min_value, max_value, edit_mode
        )

    @staticmethod
    def slider(
        bounds: Rectangle,
        text_left: String,
        text_right: String,
        mut value: Float32,
        min_value: Float32,
        max_value: Float32,
    ) -> Int32:
        return gui_slider(
            bounds, text_left, text_right, value, min_value, max_value
        )

    @staticmethod
    def slider_bar(
        bounds: Rectangle,
        text_left: String,
        text_right: String,
        mut value: Float32,
        min_value: Float32,
        max_value: Float32,
    ) -> Int32:
        return gui_slider_bar(
            bounds, text_left, text_right, value, min_value, max_value
        )

    @staticmethod
    def progress_bar(
        bounds: Rectangle,
        text_left: String,
        text_right: String,
        mut value: Float32,
        min_value: Float32,
        max_value: Float32,
    ) -> Int32:
        return gui_progress_bar(
            bounds, text_left, text_right, value, min_value, max_value
        )

    @staticmethod
    def status_bar(bounds: Rectangle, text: String) -> Int32:
        return gui_status_bar(bounds, text)

    @staticmethod
    def color_picker(
        bounds: Rectangle, text: String, mut color: Color
    ) -> Int32:
        return gui_color_picker(bounds, text, color)

    @staticmethod
    def message_box(
        bounds: Rectangle, title: String, message: String, buttons: String
    ) -> Int32:
        return gui_message_box(bounds, title, message, buttons)


# ============================================================================
# Stateful Widget Struct Wrappers
# ============================================================================


struct GuiCheckBox(Copyable, Movable):
    """Stateful CheckBox widget."""

    var bounds: Rectangle
    var text: String
    var checked: Bool

    def __init__(
        out self, bounds: Rectangle, text: String, checked: Bool = False
    ):
        self.bounds = bounds
        self.text = text
        self.checked = checked

    def draw(mut self) -> Bool:
        """Draw the checkbox and update checked state."""
        return gui_check_box(self.bounds, self.text, self.checked)


struct GuiSlider(Copyable, Movable):
    """Stateful Slider widget."""

    var bounds: Rectangle
    var text_left: String
    var text_right: String
    var value: Float32
    var min_value: Float32
    var max_value: Float32

    def __init__(
        out self,
        bounds: Rectangle,
        text_left: String = "",
        text_right: String = "",
        value: Float32 = 0.0,
        min_value: Float32 = 0.0,
        max_value: Float32 = 1.0,
    ):
        self.bounds = bounds
        self.text_left = text_left
        self.text_right = text_right
        self.value = value
        self.min_value = min_value
        self.max_value = max_value

    def draw(mut self) -> Int32:
        """Draw slider and update value."""
        return gui_slider(
            self.bounds,
            self.text_left,
            self.text_right,
            self.value,
            self.min_value,
            self.max_value,
        )


struct GuiSpinner(Copyable, Movable):
    """Stateful Spinner widget."""

    var bounds: Rectangle
    var text: String
    var value: Int32
    var min_value: Int32
    var max_value: Int32
    var edit_mode: Bool

    def __init__(
        out self,
        bounds: Rectangle,
        text: String = "",
        value: Int32 = 0,
        min_value: Int32 = 0,
        max_value: Int32 = 100,
        edit_mode: Bool = False,
    ):
        self.bounds = bounds
        self.text = text
        self.value = value
        self.min_value = min_value
        self.max_value = max_value
        self.edit_mode = edit_mode

    def draw(mut self) -> Int32:
        """Draw spinner and update value / edit mode state."""
        return gui_spinner(
            self.bounds,
            self.text,
            self.value,
            self.min_value,
            self.max_value,
            self.edit_mode,
        )


struct GuiValueBox(Copyable, Movable):
    """Stateful ValueBox widget."""

    var bounds: Rectangle
    var text: String
    var value: Int32
    var min_value: Int32
    var max_value: Int32
    var edit_mode: Bool

    def __init__(
        out self,
        bounds: Rectangle,
        text: String = "",
        value: Int32 = 0,
        min_value: Int32 = 0,
        max_value: Int32 = 100,
        edit_mode: Bool = False,
    ):
        self.bounds = bounds
        self.text = text
        self.value = value
        self.min_value = min_value
        self.max_value = max_value
        self.edit_mode = edit_mode

    def draw(mut self) -> Int32:
        """Draw value box and update value / edit mode state."""
        return gui_value_box(
            self.bounds,
            self.text,
            self.value,
            self.min_value,
            self.max_value,
            self.edit_mode,
        )


struct GuiToggleGroup(Copyable, Movable):
    """Stateful ToggleGroup widget."""

    var bounds: Rectangle
    var text: String
    var active: Int32

    def __init__(out self, bounds: Rectangle, text: String, active: Int32 = 0):
        self.bounds = bounds
        self.text = text
        self.active = active

    def draw(mut self) -> Int32:
        """Draw toggle group and update active selection index."""
        return gui_toggle_group(self.bounds, self.text, self.active)


struct GuiComboBox(Copyable, Movable):
    """Stateful ComboBox widget."""

    var bounds: Rectangle
    var text: String
    var active: Int32

    def __init__(out self, bounds: Rectangle, text: String, active: Int32 = 0):
        self.bounds = bounds
        self.text = text
        self.active = active

    def draw(mut self) -> Int32:
        """Draw combo box and update active selection index."""
        return gui_combo_box(self.bounds, self.text, self.active)


struct GuiDropdownBox(Copyable, Movable):
    """Stateful DropdownBox widget."""

    var bounds: Rectangle
    var text: String
    var active: Int32
    var edit_mode: Bool

    def __init__(
        out self,
        bounds: Rectangle,
        text: String,
        active: Int32 = 0,
        edit_mode: Bool = False,
    ):
        self.bounds = bounds
        self.text = text
        self.active = active
        self.edit_mode = edit_mode

    def draw(mut self) -> Int32:
        """Draw dropdown box and update active index / edit mode state."""
        return gui_dropdown_box(
            self.bounds, self.text, self.active, self.edit_mode
        )


struct GuiColorPicker(Copyable, Movable):
    """Stateful ColorPicker widget."""

    var bounds: Rectangle
    var text: String
    var color: Color

    def __init__(
        out self, bounds: Rectangle, text: String = "", color: Color = Color()
    ):
        self.bounds = bounds
        self.text = text
        self.color = color

    def draw(mut self) -> Int32:
        """Draw color picker and update color."""
        return gui_color_picker(self.bounds, self.text, self.color)

"""Raygui control states, properties, and icon constants."""

# Control states
comptime STATE_NORMAL: Int32 = 0
comptime STATE_FOCUSED: Int32 = 1
comptime STATE_PRESSED: Int32 = 2
comptime STATE_DISABLED: Int32 = 3

# Control text alignment
comptime TEXT_ALIGN_LEFT: Int32 = 0
comptime TEXT_ALIGN_CENTER: Int32 = 1
comptime TEXT_ALIGN_RIGHT: Int32 = 2

# Control text alignment vertical
comptime TEXT_ALIGN_TOP: Int32 = 0
comptime TEXT_ALIGN_MIDDLE: Int32 = 1
comptime TEXT_ALIGN_BOTTOM: Int32 = 2

# Raygui controls
comptime DEFAULT: Int32 = 0
comptime LABEL: Int32 = 1
comptime BUTTON: Int32 = 2
comptime TOGGLE: Int32 = 3
comptime SLIDER: Int32 = 4
comptime PROGRESSBAR: Int32 = 5
comptime CHECKBOX: Int32 = 6
comptime COMBOBOX: Int32 = 7
comptime DROPDOWNBOX: Int32 = 8
comptime TEXTBOX: Int32 = 9
comptime VALUEBOX: Int32 = 10
comptime SPINNER: Int32 = 11
comptime LISTVIEW: Int32 = 12
comptime COLORPICKER: Int32 = 13
comptime SCROLLBAR: Int32 = 14
comptime STATUSBAR: Int32 = 15

# Default control properties
comptime BORDER_COLOR_NORMAL: Int32 = 0
comptime BASE_COLOR_NORMAL: Int32 = 1
comptime TEXT_COLOR_NORMAL: Int32 = 2
comptime BORDER_COLOR_FOCUSED: Int32 = 3
comptime BASE_COLOR_FOCUSED: Int32 = 4
comptime TEXT_COLOR_FOCUSED: Int32 = 5
comptime BORDER_COLOR_PRESSED: Int32 = 6
comptime BASE_COLOR_PRESSED: Int32 = 7
comptime TEXT_COLOR_PRESSED: Int32 = 8
comptime BORDER_COLOR_DISABLED: Int32 = 9
comptime BASE_COLOR_DISABLED: Int32 = 10
comptime TEXT_COLOR_DISABLED: Int32 = 11
comptime BORDER_WIDTH: Int32 = 12
comptime TEXT_PADDING: Int32 = 13
comptime TEXT_ALIGNMENT: Int32 = 14
comptime TEXT_SIZE: Int32 = 15
comptime TEXT_SPACING: Int32 = 16
comptime LINE_COLOR: Int32 = 17
comptime BACKGROUND_COLOR: Int32 = 18
comptime TEXT_LINE_SPACING: Int32 = 19
comptime TEXT_ALIGNMENT_VERTICAL: Int32 = 20
comptime TEXT_WRAP_MODE: Int32 = 21

# Toggle / ToggleGroup properties
comptime GROUP_PADDING: Int32 = 16

# Slider / SliderBar properties
comptime SLIDER_WIDTH: Int32 = 16
comptime SLIDER_PADDING: Int32 = 17

# CheckBox properties
comptime CHECK_PADDING: Int32 = 16

# ComboBox properties
comptime COMBO_BUTTON_WIDTH: Int32 = 16
comptime COMBO_BUTTON_SPACING: Int32 = 17

# DropdownBox properties
comptime ARROW_PADDING: Int32 = 16
comptime DROPDOWN_ITEMS_SPACING: Int32 = 17

# TextBox / ValueBox / Spinner properties
comptime TEXT_READONLY: Int32 = 16

# Spinner properties
comptime SPIN_BUTTON_WIDTH: Int32 = 16
comptime SPIN_BUTTON_SPACING: Int32 = 17

# ListView properties
comptime LIST_ITEMS_HEIGHT: Int32 = 16
comptime LIST_ITEMS_SPACING: Int32 = 17
comptime SCROLLBAR_WIDTH: Int32 = 18
comptime SCROLLBAR_SIDE: Int32 = 19

# ColorPicker properties
comptime COLOR_SELECTOR_SIZE: Int32 = 16
comptime HUEBAR_WIDTH: Int32 = 17
comptime HUEBAR_PADDING: Int32 = 18
comptime ALPHABAR_PADDING: Int32 = 19

# Common Raygui Icons
comptime ICON_NONE: Int32 = 0
comptime ICON_FOLDER_FILE_OPEN: Int32 = 1
comptime ICON_FILE_SAVE_CLASSIC: Int32 = 2
comptime ICON_FILE_SAVE_RED: Int32 = 3
comptime ICON_FILE_NEW: Int32 = 4
comptime ICON_FILE_DELETE: Int32 = 5
comptime ICON_FILE_OPEN: Int32 = 6
comptime ICON_PENCIL: Int32 = 7
comptime ICON_TOOLS: Int32 = 8
comptime ICON_GEAR: Int32 = 142
comptime ICON_BURGER_MENU: Int32 = 144
comptime ICON_PLAYER_PLAY: Int32 = 131
comptime ICON_PLAYER_PAUSE: Int32 = 132
comptime ICON_PLAYER_STOP: Int32 = 133
comptime ICON_EYE_ON: Int32 = 147
comptime ICON_EYE_OFF: Int32 = 148
comptime ICON_ARROW_DOWN_FILL: Int32 = 115
comptime ICON_ARROW_RIGHT_FILL: Int32 = 118
comptime ICON_CROSS: Int32 = 18
comptime ICON_CHECK: Int32 = 19
comptime ICON_HEART: Int32 = 20
comptime ICON_STAR: Int32 = 21
comptime ICON_HOUSE: Int32 = 184

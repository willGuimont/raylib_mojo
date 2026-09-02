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


def GuiEnable():
    external_call["GuiEnable", NoneType]()


def GuiDisable():
    external_call["GuiDisable", NoneType]()


def GuiLock():
    external_call["GuiLock", NoneType]()


def GuiUnlock():
    external_call["GuiUnlock", NoneType]()


def GuiIsLocked() -> Bool:
    return external_call["GuiIsLocked", Bool]()


def GuiSetAlpha(alpha: Float32):
    external_call["GuiSetAlpha", NoneType](alpha)


def GuiSetState(state: Int32):
    external_call["GuiSetState", NoneType](state)


def GuiGetState() -> Int32:
    return external_call["GuiGetState", Int32]()


def GuiSetFont(font: Font):
    external_call["GuiSetFont", NoneType](font)


def GuiGetFont() -> Font:
    return external_call["GuiGetFont", Font]()


def GuiSetStyle(control: Int32, property: Int32, value: Int32):
    external_call["GuiSetStyle", NoneType](control, property, value)


def GuiGetStyle(control: Int32, property: Int32) -> Int32:
    return external_call["GuiGetStyle", Int32](control, property)


def GuiLoadStyle(fileName: Pointer[UInt8, origin=_]):
    external_call["GuiLoadStyle", NoneType](fileName)


def GuiLoadStyleFromMemory(fileData: Pointer[UInt8, origin=_], dataSize: Int32):
    external_call["GuiLoadStyleFromMemory", NoneType](fileData, dataSize)


def GuiLoadStyleDefault():
    external_call["GuiLoadStyleDefault", NoneType]()


def GuiEnableTooltip():
    external_call["GuiEnableTooltip", NoneType]()


def GuiDisableTooltip():
    external_call["GuiDisableTooltip", NoneType]()


def GuiSetTooltip(tooltip: Pointer[UInt8, origin=_]):
    external_call["GuiSetTooltip", NoneType](tooltip)


def GuiIconText(
    iconId: Int32, text: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=ImmutAnyOrigin]:
    return external_call["GuiIconText", Pointer[UInt8, origin=ImmutAnyOrigin]](
        iconId, text
    )


def GuiSetIconScale(scale: Int32):
    external_call["GuiSetIconScale", NoneType](scale)


def GuiGetIcons() -> Pointer[UInt32, origin=ImmutAnyOrigin]:
    return external_call[
        "GuiGetIcons", Pointer[UInt32, origin=ImmutAnyOrigin]
    ]()


def GuiLoadIcons(
    fileName: Pointer[UInt8, origin=_], loadIconsName: Bool
) -> Pointer[UInt8, origin=ImmutAnyOrigin]:
    return external_call["GuiLoadIcons", Pointer[UInt8, origin=ImmutAnyOrigin]](
        fileName, loadIconsName
    )


def GuiLoadIconsFromMemory(
    fileData: Pointer[UInt8, origin=_], dataSize: Int32, loadIconsName: Bool
) -> Pointer[UInt8, origin=ImmutAnyOrigin]:
    return external_call[
        "GuiLoadIconsFromMemory", Pointer[UInt8, origin=ImmutAnyOrigin]
    ](fileData, dataSize, loadIconsName)


def GuiDrawIcon(
    iconId: Int32, posX: Int32, posY: Int32, pixelSize: Int32, color: Color
):
    external_call["GuiDrawIcon", NoneType](
        iconId, posX, posY, pixelSize, color.to_u32()
    )


def GuiGetTextWidth(text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiGetTextWidth", Int32](text)


def GuiWindowBox(bounds: Rectangle, title: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiWindowBox", Int32](bounds, title)


def GuiGroupBox(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiGroupBox", Int32](bounds, text)


def GuiLine(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiLine", Int32](bounds, text)


def GuiPanel(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiPanel", Int32](bounds, text)


def GuiScrollPanel(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    content: Rectangle,
    scroll: Pointer[Vector2, origin=_],
    view: Pointer[Rectangle, origin=_],
) -> Int32:
    return external_call["GuiScrollPanel", Int32](
        bounds, text, content, scroll, view
    )


def GuiLabel(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiLabel", Int32](bounds, text)


def GuiButton(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiButton", Int32](bounds, text)


def GuiLabelButton(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiLabelButton", Int32](bounds, text)


def GuiToggle(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    active: Pointer[Bool, origin=_],
) -> Int32:
    return external_call["GuiToggle", Int32](bounds, text, active)


def GuiToggleGroup(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    active: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiToggleGroup", Int32](bounds, text, active)


def GuiToggleSlider(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    active: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiToggleSlider", Int32](bounds, text, active)


def GuiCheckBox(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    checked: Pointer[Bool, origin=_],
) -> Int32:
    return external_call["GuiCheckBox", Int32](bounds, text, checked)


def GuiComboBox(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    active: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiComboBox", Int32](bounds, text, active)


def GuiDropdownBox(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    active: Pointer[Int32, origin=_],
    editMode: Bool,
) -> Int32:
    return external_call["GuiDropdownBox", Int32](
        bounds, text, active, editMode
    )


def GuiSpinner(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    value: Pointer[Int32, origin=_],
    minValue: Int32,
    maxValue: Int32,
    editMode: Bool,
) -> Int32:
    return external_call["GuiSpinner", Int32](
        bounds, text, value, minValue, maxValue, editMode
    )


def GuiValueBox(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    value: Pointer[Int32, origin=_],
    minValue: Int32,
    maxValue: Int32,
    editMode: Bool,
) -> Int32:
    return external_call["GuiValueBox", Int32](
        bounds, text, value, minValue, maxValue, editMode
    )


def GuiValueBoxFloat(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    textValue: Pointer[UInt8, origin=_],
    value: Pointer[Float32, origin=_],
    editMode: Bool,
) -> Int32:
    return external_call["GuiValueBoxFloat", Int32](
        bounds, text, textValue, value, editMode
    )


def GuiTextBox(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    textSize: Int32,
    editMode: Bool,
) -> Int32:
    return external_call["GuiTextBox", Int32](bounds, text, textSize, editMode)


def GuiSlider(
    bounds: Rectangle,
    textLeft: Pointer[UInt8, origin=_],
    textRight: Pointer[UInt8, origin=_],
    value: Pointer[Float32, origin=_],
    minValue: Float32,
    maxValue: Float32,
) -> Int32:
    return external_call["GuiSlider", Int32](
        bounds, textLeft, textRight, value, minValue, maxValue
    )


def GuiSliderBar(
    bounds: Rectangle,
    textLeft: Pointer[UInt8, origin=_],
    textRight: Pointer[UInt8, origin=_],
    value: Pointer[Float32, origin=_],
    minValue: Float32,
    maxValue: Float32,
) -> Int32:
    return external_call["GuiSliderBar", Int32](
        bounds, textLeft, textRight, value, minValue, maxValue
    )


def GuiProgressBar(
    bounds: Rectangle,
    textLeft: Pointer[UInt8, origin=_],
    textRight: Pointer[UInt8, origin=_],
    value: Pointer[Float32, origin=_],
    minValue: Float32,
    maxValue: Float32,
) -> Int32:
    return external_call["GuiProgressBar", Int32](
        bounds, textLeft, textRight, value, minValue, maxValue
    )


def GuiStatusBar(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiStatusBar", Int32](bounds, text)


def GuiDummyRec(bounds: Rectangle, text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GuiDummyRec", Int32](bounds, text)


def GuiGrid(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    spacing: Float32,
    subdivs: Int32,
    mouseCell: Pointer[Vector2, origin=_],
) -> Int32:
    return external_call["GuiGrid", Int32](
        bounds, text, spacing, subdivs, mouseCell
    )


def GuiListView(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    scrollIndex: Pointer[Int32, origin=_],
    active: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiListView", Int32](
        bounds, text, scrollIndex, active
    )


def GuiListViewEx(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    count: Int32,
    scrollIndex: Pointer[Int32, origin=_],
    active: Pointer[Int32, origin=_],
    focus: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiListViewEx", Int32](
        bounds, text, count, scrollIndex, active, focus
    )


def GuiTabBar(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    hscroll: Pointer[Int32, origin=_],
    active: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiTabBar", Int32](bounds, text, hscroll, active)


def GuiTabBarEx(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    count: Int32,
    hscroll: Pointer[Int32, origin=_],
    active: Pointer[Int32, origin=_],
    focus: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiTabBarEx", Int32](
        bounds, text, count, hscroll, active, focus
    )


def GuiMessageBox(
    bounds: Rectangle,
    title: Pointer[UInt8, origin=_],
    message: Pointer[UInt8, origin=_],
    btnText: Pointer[UInt8, origin=_],
    btnActive: Pointer[Int32, origin=_],
) -> Int32:
    return external_call["GuiMessageBox", Int32](
        bounds, title, message, btnText, btnActive
    )


def GuiTextInputBox(
    bounds: Rectangle,
    title: Pointer[UInt8, origin=_],
    message: Pointer[UInt8, origin=_],
    text: Pointer[UInt8, origin=_],
    textSize: Int32,
    btnText: Pointer[UInt8, origin=_],
    btnActive: Pointer[Int32, origin=_],
    secretViewActive: Pointer[Bool, origin=_],
) -> Int32:
    return external_call["GuiTextInputBox", Int32](
        bounds,
        title,
        message,
        text,
        textSize,
        btnText,
        btnActive,
        secretViewActive,
    )


def GuiColorPicker(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    color: Pointer[Color, origin=_],
) -> Int32:
    return external_call["GuiColorPicker", Int32](bounds, text, color)


def GuiColorPanel(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    color: Pointer[Color, origin=_],
) -> Int32:
    return external_call["GuiColorPanel", Int32](bounds, text, color)


def GuiColorBarAlpha(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    alpha: Pointer[Float32, origin=_],
) -> Int32:
    return external_call["GuiColorBarAlpha", Int32](bounds, text, alpha)


def GuiColorBarHue(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    value: Pointer[Float32, origin=_],
) -> Int32:
    return external_call["GuiColorBarHue", Int32](bounds, text, value)


def GuiColorPickerHSV(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    colorHsv: Pointer[Vector3, origin=_],
) -> Int32:
    return external_call["GuiColorPickerHSV", Int32](bounds, text, colorHsv)


def GuiColorPanelHSV(
    bounds: Rectangle,
    text: Pointer[UInt8, origin=_],
    colorHsv: Pointer[Vector3, origin=_],
) -> Int32:
    return external_call["GuiColorPanelHSV", Int32](bounds, text, colorHsv)

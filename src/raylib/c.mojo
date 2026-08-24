from std.ffi import external_call, c_int, c_float, c_char
from std.memory import Pointer
from raylib.types import (
    Vector2,
    Vector3,
    Vector4,
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


def InitWindow(width: Int32, height: Int32, title: Pointer[UInt8, origin=_]):
    external_call["InitWindow", NoneType](width, height, title)


def CloseWindow():
    external_call["CloseWindow", NoneType]()


def WindowShouldClose() -> Bool:
    return external_call["WindowShouldClose", Bool]()


def IsWindowReady() -> Bool:
    return external_call["IsWindowReady", Bool]()


def IsWindowFullscreen() -> Bool:
    return external_call["IsWindowFullscreen", Bool]()


def IsWindowHidden() -> Bool:
    return external_call["IsWindowHidden", Bool]()


def IsWindowMinimized() -> Bool:
    return external_call["IsWindowMinimized", Bool]()


def IsWindowMaximized() -> Bool:
    return external_call["IsWindowMaximized", Bool]()


def IsWindowFocused() -> Bool:
    return external_call["IsWindowFocused", Bool]()


def IsWindowResized() -> Bool:
    return external_call["IsWindowResized", Bool]()


def IsWindowState(flag: UInt32) -> Bool:
    return external_call["IsWindowState", Bool](flag)


def SetWindowState(flags: UInt32):
    external_call["SetWindowState", NoneType](flags)


def ClearWindowState(flags: UInt32):
    external_call["ClearWindowState", NoneType](flags)


def ToggleFullscreen():
    external_call["ToggleFullscreen", NoneType]()


def ToggleBorderlessWindowed():
    external_call["ToggleBorderlessWindowed", NoneType]()


def MaximizeWindow():
    external_call["MaximizeWindow", NoneType]()


def MinimizeWindow():
    external_call["MinimizeWindow", NoneType]()


def RestoreWindow():
    external_call["RestoreWindow", NoneType]()


def SetWindowIcon(image: Image):
    external_call["SetWindowIcon", NoneType](image)


def SetWindowIcons(images: Pointer[Image, origin=_], count: Int32):
    external_call["SetWindowIcons", NoneType](images, count)


def SetWindowTitle(title: Pointer[UInt8, origin=_]):
    external_call["SetWindowTitle", NoneType](title)


def SetWindowPosition(x: Int32, y: Int32):
    external_call["SetWindowPosition", NoneType](x, y)


def SetWindowMonitor(monitor: Int32):
    external_call["SetWindowMonitor", NoneType](monitor)


def SetWindowMinSize(width: Int32, height: Int32):
    external_call["SetWindowMinSize", NoneType](width, height)


def SetWindowMaxSize(width: Int32, height: Int32):
    external_call["SetWindowMaxSize", NoneType](width, height)


def SetWindowSize(width: Int32, height: Int32):
    external_call["SetWindowSize", NoneType](width, height)


def SetWindowOpacity(opacity: Float32):
    external_call["SetWindowOpacity", NoneType](opacity)


def SetWindowFocused():
    external_call["SetWindowFocused", NoneType]()


def GetWindowHandle() -> Pointer[NoneType, origin=_]:
    return external_call["GetWindowHandle", Pointer[NoneType, origin=_]]()


def GetScreenWidth() -> Int32:
    return external_call["GetScreenWidth", Int32]()


def GetScreenHeight() -> Int32:
    return external_call["GetScreenHeight", Int32]()


def GetRenderWidth() -> Int32:
    return external_call["GetRenderWidth", Int32]()


def GetRenderHeight() -> Int32:
    return external_call["GetRenderHeight", Int32]()


def GetMonitorCount() -> Int32:
    return external_call["GetMonitorCount", Int32]()


def GetCurrentMonitor() -> Int32:
    return external_call["GetCurrentMonitor", Int32]()


def GetMonitorPosition(monitor: Int32) -> Vector2:
    return external_call["GetMonitorPosition", Vector2](monitor)


def GetMonitorWidth(monitor: Int32) -> Int32:
    return external_call["GetMonitorWidth", Int32](monitor)


def GetMonitorHeight(monitor: Int32) -> Int32:
    return external_call["GetMonitorHeight", Int32](monitor)


def GetMonitorPhysicalWidth(monitor: Int32) -> Int32:
    return external_call["GetMonitorPhysicalWidth", Int32](monitor)


def GetMonitorPhysicalHeight(monitor: Int32) -> Int32:
    return external_call["GetMonitorPhysicalHeight", Int32](monitor)


def GetMonitorRefreshRate(monitor: Int32) -> Int32:
    return external_call["GetMonitorRefreshRate", Int32](monitor)


def GetWindowPosition() -> Vector2:
    return external_call["GetWindowPosition", Vector2]()


def GetWindowScaleDPI() -> Vector2:
    return external_call["GetWindowScaleDPI", Vector2]()


def GetMonitorName(monitor: Int32) -> Pointer[UInt8, origin=_]:
    return external_call["GetMonitorName", Pointer[UInt8, origin=_]](monitor)


def SetClipboardText(text: Pointer[UInt8, origin=_]):
    external_call["SetClipboardText", NoneType](text)


def GetClipboardText() -> Pointer[UInt8, origin=_]:
    return external_call["GetClipboardText", Pointer[UInt8, origin=_]]()


def GetClipboardImage() -> Image:
    return external_call["GetClipboardImage", Image]()


def EnableEventWaiting():
    external_call["EnableEventWaiting", NoneType]()


def DisableEventWaiting():
    external_call["DisableEventWaiting", NoneType]()


def ShowCursor():
    external_call["ShowCursor", NoneType]()


def HideCursor():
    external_call["HideCursor", NoneType]()


def IsCursorHidden() -> Bool:
    return external_call["IsCursorHidden", Bool]()


def EnableCursor():
    external_call["EnableCursor", NoneType]()


def DisableCursor():
    external_call["DisableCursor", NoneType]()


def IsCursorOnScreen() -> Bool:
    return external_call["IsCursorOnScreen", Bool]()


def ClearBackground(color: Color):
    external_call["ClearBackground", NoneType](color)


def BeginDrawing():
    external_call["BeginDrawing", NoneType]()


def EndDrawing():
    external_call["EndDrawing", NoneType]()


def BeginMode2D(camera: Camera2D):
    external_call["BeginMode2D", NoneType](camera)


def EndMode2D():
    external_call["EndMode2D", NoneType]()


def BeginMode3D(camera: Camera3D):
    external_call["BeginMode3D", NoneType](camera)


def EndMode3D():
    external_call["EndMode3D", NoneType]()


def BeginTextureMode(target: RenderTexture):
    external_call["BeginTextureMode", NoneType](target)


def EndTextureMode():
    external_call["EndTextureMode", NoneType]()


def BeginShaderMode(shader: Shader):
    external_call["BeginShaderMode", NoneType](shader)


def EndShaderMode():
    external_call["EndShaderMode", NoneType]()


def BeginBlendMode(mode: Int32):
    external_call["BeginBlendMode", NoneType](mode)


def EndBlendMode():
    external_call["EndBlendMode", NoneType]()


def BeginScissorMode(x: Int32, y: Int32, width: Int32, height: Int32):
    external_call["BeginScissorMode", NoneType](x, y, width, height)


def EndScissorMode():
    external_call["EndScissorMode", NoneType]()


def BeginVrStereoMode(config: VrStereoConfig):
    external_call["BeginVrStereoMode", NoneType](config)


def EndVrStereoMode():
    external_call["EndVrStereoMode", NoneType]()


def LoadVrStereoConfig(device: VrDeviceInfo) -> VrStereoConfig:
    return external_call["LoadVrStereoConfig", VrStereoConfig](device)


def UnloadVrStereoConfig(config: VrStereoConfig):
    external_call["UnloadVrStereoConfig", NoneType](config)


def LoadShader(
    vsFileName: Pointer[UInt8, origin=_], fsFileName: Pointer[UInt8, origin=_]
) -> Shader:
    return external_call["LoadShader", Shader](vsFileName, fsFileName)


def LoadShaderFromMemory(
    vsCode: Pointer[UInt8, origin=_], fsCode: Pointer[UInt8, origin=_]
) -> Shader:
    return external_call["LoadShaderFromMemory", Shader](vsCode, fsCode)


def IsShaderValid(shader: Shader) -> Bool:
    return external_call["IsShaderValid", Bool](shader)


def GetShaderLocation(
    shader: Shader, uniformName: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["GetShaderLocation", Int32](shader, uniformName)


def GetShaderLocationAttrib(
    shader: Shader, attribName: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["GetShaderLocationAttrib", Int32](shader, attribName)


def SetShaderValue(
    shader: Shader,
    locIndex: Int32,
    value: Pointer[NoneType, origin=_],
    uniformType: Int32,
):
    external_call["SetShaderValue", NoneType](
        shader, locIndex, value, uniformType
    )


def SetShaderValueV(
    shader: Shader,
    locIndex: Int32,
    value: Pointer[NoneType, origin=_],
    uniformType: Int32,
    count: Int32,
):
    external_call["SetShaderValueV", NoneType](
        shader, locIndex, value, uniformType, count
    )


def SetShaderValueMatrix(shader: Shader, locIndex: Int32, mat: Matrix):
    external_call["SetShaderValueMatrix", NoneType](shader, locIndex, mat)


def SetShaderValueTexture(shader: Shader, locIndex: Int32, texture: Texture):
    external_call["SetShaderValueTexture", NoneType](shader, locIndex, texture)


def UnloadShader(shader: Shader):
    external_call["UnloadShader", NoneType](shader)


def GetScreenToWorldRay(position: Vector2, camera: Camera3D) -> Ray:
    return external_call["GetScreenToWorldRay", Ray](position, camera)


def GetScreenToWorldRayEx(
    position: Vector2, camera: Camera3D, width: Int32, height: Int32
) -> Ray:
    return external_call["GetScreenToWorldRayEx", Ray](
        position, camera, width, height
    )


def GetWorldToScreen(position: Vector3, camera: Camera3D) -> Vector2:
    return external_call["GetWorldToScreen", Vector2](position, camera)


def GetWorldToScreenEx(
    position: Vector3, camera: Camera3D, width: Int32, height: Int32
) -> Vector2:
    return external_call["GetWorldToScreenEx", Vector2](
        position, camera, width, height
    )


def GetWorldToScreen2D(position: Vector2, camera: Camera2D) -> Vector2:
    return external_call["GetWorldToScreen2D", Vector2](position, camera)


def GetScreenToWorld2D(position: Vector2, camera: Camera2D) -> Vector2:
    return external_call["GetScreenToWorld2D", Vector2](position, camera)


def GetCameraMatrix(camera: Camera3D) -> Matrix:
    return external_call["GetCameraMatrix", Matrix](camera)


def GetCameraMatrix2D(camera: Camera2D) -> Matrix:
    return external_call["GetCameraMatrix2D", Matrix](camera)


def SetTargetFPS(fps: Int32):
    external_call["SetTargetFPS", NoneType](fps)


def GetFrameTime() -> Float32:
    return external_call["GetFrameTime", Float32]()


def GetTime() -> Float64:
    return external_call["GetTime", Float64]()


def GetFPS() -> Int32:
    return external_call["GetFPS", Int32]()


def SwapScreenBuffer():
    external_call["SwapScreenBuffer", NoneType]()


def PollInputEvents():
    external_call["PollInputEvents", NoneType]()


def WaitTime(seconds: Float64):
    external_call["WaitTime", NoneType](seconds)


def SetRandomSeed(seed: UInt32):
    external_call["SetRandomSeed", NoneType](seed)


def GetRandomValue(min: Int32, max: Int32) -> Int32:
    return external_call["GetRandomValue", Int32](min, max)


def LoadRandomSequence(
    count: UInt32, min: Int32, max: Int32
) -> Pointer[Int32, origin=_]:
    return external_call["LoadRandomSequence", Pointer[Int32, origin=_]](
        count, min, max
    )


def UnloadRandomSequence(sequence: Pointer[Int32, origin=_]):
    external_call["UnloadRandomSequence", NoneType](sequence)


def TakeScreenshot(fileName: Pointer[UInt8, origin=_]):
    external_call["TakeScreenshot", NoneType](fileName)


def SetConfigFlags(flags: UInt32):
    external_call["SetConfigFlags", NoneType](flags)


def OpenURL(url: Pointer[UInt8, origin=_]):
    external_call["OpenURL", NoneType](url)


def SetTraceLogLevel(logLevel: Int32):
    external_call["SetTraceLogLevel", NoneType](logLevel)


def TraceLog(logLevel: Int32, text: Pointer[UInt8, origin=_]):
    external_call["TraceLog", NoneType](logLevel, text)


def SetTraceLogCallback(callback: Pointer[NoneType, origin=_]):
    external_call["SetTraceLogCallback", NoneType](callback)


def MemAlloc(size: UInt32) -> Pointer[NoneType, origin=_]:
    return external_call["MemAlloc", Pointer[NoneType, origin=_]](size)


def MemRealloc(
    ptr: Pointer[NoneType, origin=_], size: UInt32
) -> Pointer[NoneType, origin=_]:
    return external_call["MemRealloc", Pointer[NoneType, origin=_]](ptr, size)


def MemFree(ptr: Pointer[NoneType, origin=_]):
    external_call["MemFree", NoneType](ptr)


def LoadFileData(
    fileName: Pointer[UInt8, origin=_], dataSize: Pointer[Int32, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["LoadFileData", Pointer[UInt8, origin=_]](
        fileName, dataSize
    )


def UnloadFileData(data: Pointer[UInt8, origin=_]):
    external_call["UnloadFileData", NoneType](data)


def SaveFileData(
    fileName: Pointer[UInt8, origin=_],
    data: Pointer[NoneType, origin=_],
    dataSize: Int32,
) -> Bool:
    return external_call["SaveFileData", Bool](fileName, data, dataSize)


def ExportDataAsCode(
    data: Pointer[UInt8, origin=_],
    dataSize: Int32,
    fileName: Pointer[UInt8, origin=_],
) -> Bool:
    return external_call["ExportDataAsCode", Bool](data, dataSize, fileName)


def LoadFileText(
    fileName: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["LoadFileText", Pointer[UInt8, origin=_]](fileName)


def UnloadFileText(text: Pointer[UInt8, origin=_]):
    external_call["UnloadFileText", NoneType](text)


def SaveFileText(
    fileName: Pointer[UInt8, origin=_], text: Pointer[UInt8, origin=_]
) -> Bool:
    return external_call["SaveFileText", Bool](fileName, text)


def SetLoadFileDataCallback(callback: Pointer[NoneType, origin=_]):
    external_call["SetLoadFileDataCallback", NoneType](callback)


def SetSaveFileDataCallback(callback: Pointer[NoneType, origin=_]):
    external_call["SetSaveFileDataCallback", NoneType](callback)


def SetLoadFileTextCallback(callback: Pointer[NoneType, origin=_]):
    external_call["SetLoadFileTextCallback", NoneType](callback)


def SetSaveFileTextCallback(callback: Pointer[NoneType, origin=_]):
    external_call["SetSaveFileTextCallback", NoneType](callback)


def FileRename(
    fileName: Pointer[UInt8, origin=_], fileRename: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["FileRename", Int32](fileName, fileRename)


def FileRemove(fileName: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["FileRemove", Int32](fileName)


def FileCopy(
    srcPath: Pointer[UInt8, origin=_], dstPath: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["FileCopy", Int32](srcPath, dstPath)


def FileMove(
    srcPath: Pointer[UInt8, origin=_], dstPath: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["FileMove", Int32](srcPath, dstPath)


def FileTextReplace(
    fileName: Pointer[UInt8, origin=_],
    search: Pointer[UInt8, origin=_],
    replacement: Pointer[UInt8, origin=_],
) -> Int32:
    return external_call["FileTextReplace", Int32](
        fileName, search, replacement
    )


def FileTextFindIndex(
    fileName: Pointer[UInt8, origin=_], search: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["FileTextFindIndex", Int32](fileName, search)


def FileExists(fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["FileExists", Bool](fileName)


def DirectoryExists(dirPath: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["DirectoryExists", Bool](dirPath)


def IsFileExtension(
    fileName: Pointer[UInt8, origin=_], ext: Pointer[UInt8, origin=_]
) -> Bool:
    return external_call["IsFileExtension", Bool](fileName, ext)


def GetFileLength(fileName: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GetFileLength", Int32](fileName)


def GetFileModTime(fileName: Pointer[UInt8, origin=_]) -> Int64:
    return external_call["GetFileModTime", Int64](fileName)


def GetFileExtension(
    fileName: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["GetFileExtension", Pointer[UInt8, origin=_]](fileName)


def GetFileName(filePath: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["GetFileName", Pointer[UInt8, origin=_]](filePath)


def GetFileNameWithoutExt(
    filePath: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["GetFileNameWithoutExt", Pointer[UInt8, origin=_]](
        filePath
    )


def GetDirectoryPath(
    filePath: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["GetDirectoryPath", Pointer[UInt8, origin=_]](filePath)


def GetPrevDirectoryPath(
    dirPath: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["GetPrevDirectoryPath", Pointer[UInt8, origin=_]](
        dirPath
    )


def GetWorkingDirectory() -> Pointer[UInt8, origin=_]:
    return external_call["GetWorkingDirectory", Pointer[UInt8, origin=_]]()


def GetApplicationDirectory() -> Pointer[UInt8, origin=_]:
    return external_call["GetApplicationDirectory", Pointer[UInt8, origin=_]]()


def MakeDirectory(dirPath: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["MakeDirectory", Int32](dirPath)


def ChangeDirectory(dirPath: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["ChangeDirectory", Int32](dirPath)


def IsPathFile(path: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["IsPathFile", Bool](path)


def IsPathDirectory(path: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["IsPathDirectory", Bool](path)


def IsPathAbsolute(path: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["IsPathAbsolute", Bool](path)


def IsFileNameValid(fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["IsFileNameValid", Bool](fileName)


def LoadDirectoryFiles(dirPath: Pointer[UInt8, origin=_]) -> FilePathList:
    return external_call["LoadDirectoryFiles", FilePathList](dirPath)


def LoadDirectoryFilesEx(
    basePath: Pointer[UInt8, origin=_],
    filter: Pointer[UInt8, origin=_],
    scanSubdirs: Bool,
) -> FilePathList:
    return external_call["LoadDirectoryFilesEx", FilePathList](
        basePath, filter, scanSubdirs
    )


def UnloadDirectoryFiles(files: FilePathList):
    external_call["UnloadDirectoryFiles", NoneType](files)


def IsFileDropped() -> Bool:
    return external_call["IsFileDropped", Bool]()


def LoadDroppedFiles() -> FilePathList:
    return external_call["LoadDroppedFiles", FilePathList]()


def UnloadDroppedFiles(files: FilePathList):
    external_call["UnloadDroppedFiles", NoneType](files)


def GetDirectoryFileCount(dirPath: Pointer[UInt8, origin=_]) -> UInt32:
    return external_call["GetDirectoryFileCount", UInt32](dirPath)


def GetDirectoryFileCountEx(
    basePath: Pointer[UInt8, origin=_],
    filter: Pointer[UInt8, origin=_],
    scanSubdirs: Bool,
) -> UInt32:
    return external_call["GetDirectoryFileCountEx", UInt32](
        basePath, filter, scanSubdirs
    )


def CompressData(
    data: Pointer[UInt8, origin=_],
    dataSize: Int32,
    compDataSize: Pointer[Int32, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["CompressData", Pointer[UInt8, origin=_]](
        data, dataSize, compDataSize
    )


def DecompressData(
    compData: Pointer[UInt8, origin=_],
    compDataSize: Int32,
    dataSize: Pointer[Int32, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["DecompressData", Pointer[UInt8, origin=_]](
        compData, compDataSize, dataSize
    )


def EncodeDataBase64(
    data: Pointer[UInt8, origin=_],
    dataSize: Int32,
    outputSize: Pointer[Int32, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["EncodeDataBase64", Pointer[UInt8, origin=_]](
        data, dataSize, outputSize
    )


def DecodeDataBase64(
    text: Pointer[UInt8, origin=_], outputSize: Pointer[Int32, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["DecodeDataBase64", Pointer[UInt8, origin=_]](
        text, outputSize
    )


def ComputeCRC32(data: Pointer[UInt8, origin=_], dataSize: Int32) -> UInt32:
    return external_call["ComputeCRC32", UInt32](data, dataSize)


def ComputeMD5(
    data: Pointer[UInt8, origin=_], dataSize: Int32
) -> Pointer[UInt32, origin=_]:
    return external_call["ComputeMD5", Pointer[UInt32, origin=_]](
        data, dataSize
    )


def ComputeSHA1(
    data: Pointer[UInt8, origin=_], dataSize: Int32
) -> Pointer[UInt32, origin=_]:
    return external_call["ComputeSHA1", Pointer[UInt32, origin=_]](
        data, dataSize
    )


def ComputeSHA256(
    data: Pointer[UInt8, origin=_], dataSize: Int32
) -> Pointer[UInt32, origin=_]:
    return external_call["ComputeSHA256", Pointer[UInt32, origin=_]](
        data, dataSize
    )


def LoadAutomationEventList(
    fileName: Pointer[UInt8, origin=_]
) -> AutomationEventList:
    return external_call["LoadAutomationEventList", AutomationEventList](
        fileName
    )


def UnloadAutomationEventList(list: AutomationEventList):
    external_call["UnloadAutomationEventList", NoneType](list)


def ExportAutomationEventList(
    list: AutomationEventList, fileName: Pointer[UInt8, origin=_]
) -> Bool:
    return external_call["ExportAutomationEventList", Bool](list, fileName)


def SetAutomationEventList(list: Pointer[AutomationEventList, origin=_]):
    external_call["SetAutomationEventList", NoneType](list)


def SetAutomationEventBaseFrame(frame: Int32):
    external_call["SetAutomationEventBaseFrame", NoneType](frame)


def StartAutomationEventRecording():
    external_call["StartAutomationEventRecording", NoneType]()


def StopAutomationEventRecording():
    external_call["StopAutomationEventRecording", NoneType]()


def PlayAutomationEvent(event: AutomationEvent):
    external_call["PlayAutomationEvent", NoneType](event)


def IsKeyPressed(key: Int32) -> Bool:
    return external_call["IsKeyPressed", Bool](key)


def IsKeyPressedRepeat(key: Int32) -> Bool:
    return external_call["IsKeyPressedRepeat", Bool](key)


def IsKeyDown(key: Int32) -> Bool:
    return external_call["IsKeyDown", Bool](key)


def IsKeyReleased(key: Int32) -> Bool:
    return external_call["IsKeyReleased", Bool](key)


def IsKeyUp(key: Int32) -> Bool:
    return external_call["IsKeyUp", Bool](key)


def GetKeyPressed() -> Int32:
    return external_call["GetKeyPressed", Int32]()


def GetCharPressed() -> Int32:
    return external_call["GetCharPressed", Int32]()


def GetKeyName(key: Int32) -> Pointer[UInt8, origin=_]:
    return external_call["GetKeyName", Pointer[UInt8, origin=_]](key)


def SetExitKey(key: Int32):
    external_call["SetExitKey", NoneType](key)


def IsGamepadAvailable(gamepad: Int32) -> Bool:
    return external_call["IsGamepadAvailable", Bool](gamepad)


def GetGamepadName(gamepad: Int32) -> Pointer[UInt8, origin=_]:
    return external_call["GetGamepadName", Pointer[UInt8, origin=_]](gamepad)


def IsGamepadButtonPressed(gamepad: Int32, button: Int32) -> Bool:
    return external_call["IsGamepadButtonPressed", Bool](gamepad, button)


def IsGamepadButtonDown(gamepad: Int32, button: Int32) -> Bool:
    return external_call["IsGamepadButtonDown", Bool](gamepad, button)


def IsGamepadButtonReleased(gamepad: Int32, button: Int32) -> Bool:
    return external_call["IsGamepadButtonReleased", Bool](gamepad, button)


def IsGamepadButtonUp(gamepad: Int32, button: Int32) -> Bool:
    return external_call["IsGamepadButtonUp", Bool](gamepad, button)


def GetGamepadButtonPressed() -> Int32:
    return external_call["GetGamepadButtonPressed", Int32]()


def GetGamepadAxisCount(gamepad: Int32) -> Int32:
    return external_call["GetGamepadAxisCount", Int32](gamepad)


def GetGamepadAxisMovement(gamepad: Int32, axis: Int32) -> Float32:
    return external_call["GetGamepadAxisMovement", Float32](gamepad, axis)


def SetGamepadMappings(mappings: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["SetGamepadMappings", Int32](mappings)


def SetGamepadVibration(
    gamepad: Int32, leftMotor: Float32, rightMotor: Float32, duration: Float32
):
    external_call["SetGamepadVibration", NoneType](
        gamepad, leftMotor, rightMotor, duration
    )


def IsMouseButtonPressed(button: Int32) -> Bool:
    return external_call["IsMouseButtonPressed", Bool](button)


def IsMouseButtonDown(button: Int32) -> Bool:
    return external_call["IsMouseButtonDown", Bool](button)


def IsMouseButtonReleased(button: Int32) -> Bool:
    return external_call["IsMouseButtonReleased", Bool](button)


def IsMouseButtonUp(button: Int32) -> Bool:
    return external_call["IsMouseButtonUp", Bool](button)


def GetMouseX() -> Int32:
    return external_call["GetMouseX", Int32]()


def GetMouseY() -> Int32:
    return external_call["GetMouseY", Int32]()


def GetMousePosition() -> Vector2:
    return external_call["GetMousePosition", Vector2]()


def GetMouseDelta() -> Vector2:
    return external_call["GetMouseDelta", Vector2]()


def SetMousePosition(x: Int32, y: Int32):
    external_call["SetMousePosition", NoneType](x, y)


def SetMouseOffset(offsetX: Int32, offsetY: Int32):
    external_call["SetMouseOffset", NoneType](offsetX, offsetY)


def SetMouseScale(scaleX: Float32, scaleY: Float32):
    external_call["SetMouseScale", NoneType](scaleX, scaleY)


def GetMouseWheelMove() -> Float32:
    return external_call["GetMouseWheelMove", Float32]()


def GetMouseWheelMoveV() -> Vector2:
    return external_call["GetMouseWheelMoveV", Vector2]()


def SetMouseCursor(cursor: Int32):
    external_call["SetMouseCursor", NoneType](cursor)


def GetTouchX() -> Int32:
    return external_call["GetTouchX", Int32]()


def GetTouchY() -> Int32:
    return external_call["GetTouchY", Int32]()


def GetTouchPosition(index: Int32) -> Vector2:
    return external_call["GetTouchPosition", Vector2](index)


def GetTouchPointId(index: Int32) -> Int32:
    return external_call["GetTouchPointId", Int32](index)


def GetTouchPointCount() -> Int32:
    return external_call["GetTouchPointCount", Int32]()


def SetGesturesEnabled(flags: UInt32):
    external_call["SetGesturesEnabled", NoneType](flags)


def IsGestureDetected(gesture: UInt32) -> Bool:
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


def UpdateCamera(camera: Pointer[Camera3D, origin=_], mode: Int32):
    external_call["UpdateCamera", NoneType](camera, mode)


def UpdateCameraPro(
    camera: Pointer[Camera3D, origin=_],
    movement: Vector3,
    rotation: Vector3,
    zoom: Float32,
):
    external_call["UpdateCameraPro", NoneType](camera, movement, rotation, zoom)


def SetShapesTexture(texture: Texture, rec: Rectangle):
    external_call["SetShapesTexture", NoneType](texture, rec)


def GetShapesTexture() -> Texture:
    return external_call["GetShapesTexture", Texture]()


def GetShapesTextureRectangle() -> Rectangle:
    return external_call["GetShapesTextureRectangle", Rectangle]()


def DrawPixel(posX: Int32, posY: Int32, color: Color):
    external_call["DrawPixel", NoneType](posX, posY, color)


def DrawPixelV(position: Vector2, color: Color):
    external_call["DrawPixelV", NoneType](position, color)


def DrawLine(
    startPosX: Int32,
    startPosY: Int32,
    endPosX: Int32,
    endPosY: Int32,
    color: Color,
):
    external_call["DrawLine", NoneType](
        startPosX, startPosY, endPosX, endPosY, color
    )


def DrawLineV(startPos: Vector2, endPos: Vector2, color: Color):
    external_call["DrawLineV", NoneType](startPos, endPos, color)


def DrawLineEx(
    startPos: Vector2, endPos: Vector2, thick: Float32, color: Color
):
    external_call["DrawLineEx", NoneType](startPos, endPos, thick, color)


def DrawLineStrip(
    points: Pointer[Vector2, origin=_], pointCount: Int32, color: Color
):
    external_call["DrawLineStrip", NoneType](points, pointCount, color)


def DrawLineBezier(
    startPos: Vector2, endPos: Vector2, thick: Float32, color: Color
):
    external_call["DrawLineBezier", NoneType](startPos, endPos, thick, color)


def DrawLineDashed(
    startPos: Vector2,
    endPos: Vector2,
    dashSize: Int32,
    spaceSize: Int32,
    color: Color,
):
    external_call["DrawLineDashed", NoneType](
        startPos, endPos, dashSize, spaceSize, color
    )


def DrawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color):
    external_call["DrawTriangle", NoneType](v1, v2, v3, color)


def DrawTriangleGradient(
    v1: Vector2, v2: Vector2, v3: Vector2, c1: Color, c2: Color, c3: Color
):
    external_call["DrawTriangleGradient", NoneType](v1, v2, v3, c1, c2, c3)


def DrawTriangleLines(v1: Vector2, v2: Vector2, v3: Vector2, color: Color):
    external_call["DrawTriangleLines", NoneType](v1, v2, v3, color)


def DrawTriangleFan(
    points: Pointer[Vector2, origin=_], pointCount: Int32, color: Color
):
    external_call["DrawTriangleFan", NoneType](points, pointCount, color)


def DrawTriangleStrip(
    points: Pointer[Vector2, origin=_], pointCount: Int32, color: Color
):
    external_call["DrawTriangleStrip", NoneType](points, pointCount, color)


def DrawRectangle(
    posX: Int32, posY: Int32, width: Int32, height: Int32, color: Color
):
    external_call["DrawRectangle", NoneType](posX, posY, width, height, color)


def DrawRectangleV(position: Vector2, size: Vector2, color: Color):
    external_call["DrawRectangleV", NoneType](position, size, color)


def DrawRectangleRec(rec: Rectangle, color: Color):
    external_call["DrawRectangleRec", NoneType](rec, color)


def DrawRectanglePro(
    rec: Rectangle, origin: Vector2, rotation: Float32, color: Color
):
    external_call["DrawRectanglePro", NoneType](rec, origin, rotation, color)


def DrawRectangleGradientV(
    posX: Int32,
    posY: Int32,
    width: Int32,
    height: Int32,
    top: Color,
    bottom: Color,
):
    external_call["DrawRectangleGradientV", NoneType](
        posX, posY, width, height, top, bottom
    )


def DrawRectangleGradientH(
    posX: Int32,
    posY: Int32,
    width: Int32,
    height: Int32,
    left: Color,
    right: Color,
):
    external_call["DrawRectangleGradientH", NoneType](
        posX, posY, width, height, left, right
    )


def DrawRectangleGradientEx(
    rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color
):
    external_call["DrawRectangleGradientEx", NoneType](
        rec, col1, col2, col3, col4
    )


def DrawRectangleLines(
    posX: Int32, posY: Int32, width: Int32, height: Int32, color: Color
):
    external_call["DrawRectangleLines", NoneType](
        posX, posY, width, height, color
    )


def DrawRectangleLinesEx(rec: Rectangle, thick: Float32, color: Color):
    external_call["DrawRectangleLinesEx", NoneType](rec, thick, color)


def DrawRectangleRounded(
    rec: Rectangle, roundness: Float32, segments: Int32, color: Color
):
    external_call["DrawRectangleRounded", NoneType](
        rec, roundness, segments, color
    )


def DrawRectangleRoundedLines(
    rec: Rectangle, roundness: Float32, segments: Int32, color: Color
):
    external_call["DrawRectangleRoundedLines", NoneType](
        rec, roundness, segments, color
    )


def DrawRectangleRoundedLinesEx(
    rec: Rectangle,
    roundness: Float32,
    segments: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawRectangleRoundedLinesEx", NoneType](
        rec, roundness, segments, thick, color
    )


def DrawPoly(
    center: Vector2,
    sides: Int32,
    radius: Float32,
    rotation: Float32,
    color: Color,
):
    external_call["DrawPoly", NoneType](center, sides, radius, rotation, color)


def DrawPolyLines(
    center: Vector2,
    sides: Int32,
    radius: Float32,
    rotation: Float32,
    color: Color,
):
    external_call["DrawPolyLines", NoneType](
        center, sides, radius, rotation, color
    )


def DrawPolyLinesEx(
    center: Vector2,
    sides: Int32,
    radius: Float32,
    rotation: Float32,
    thick: Float32,
    color: Color,
):
    external_call["DrawPolyLinesEx", NoneType](
        center, sides, radius, rotation, thick, color
    )


def DrawCircle(centerX: Int32, centerY: Int32, radius: Float32, color: Color):
    external_call["DrawCircle", NoneType](centerX, centerY, radius, color)


def DrawCircleV(center: Vector2, radius: Float32, color: Color):
    external_call["DrawCircleV", NoneType](center, radius, color)


def DrawCircleGradient(
    center: Vector2, radius: Float32, inner: Color, outer: Color
):
    external_call["DrawCircleGradient", NoneType](center, radius, inner, outer)


def DrawCircleSector(
    center: Vector2,
    radius: Float32,
    startAngle: Float32,
    endAngle: Float32,
    segments: Int32,
    color: Color,
):
    external_call["DrawCircleSector", NoneType](
        center, radius, startAngle, endAngle, segments, color
    )


def DrawCircleSectorLines(
    center: Vector2,
    radius: Float32,
    startAngle: Float32,
    endAngle: Float32,
    segments: Int32,
    color: Color,
):
    external_call["DrawCircleSectorLines", NoneType](
        center, radius, startAngle, endAngle, segments, color
    )


def DrawCircleLines(
    centerX: Int32, centerY: Int32, radius: Float32, color: Color
):
    external_call["DrawCircleLines", NoneType](centerX, centerY, radius, color)


def DrawCircleLinesV(center: Vector2, radius: Float32, color: Color):
    external_call["DrawCircleLinesV", NoneType](center, radius, color)


def DrawCircleLinesEx(
    center: Vector2, radius: Float32, thick: Float32, color: Color
):
    external_call["DrawCircleLinesEx", NoneType](center, radius, thick, color)


def DrawEllipse(
    centerX: Int32,
    centerY: Int32,
    radiusH: Float32,
    radiusV: Float32,
    color: Color,
):
    external_call["DrawEllipse", NoneType](
        centerX, centerY, radiusH, radiusV, color
    )


def DrawEllipseV(
    center: Vector2, radiusH: Float32, radiusV: Float32, color: Color
):
    external_call["DrawEllipseV", NoneType](center, radiusH, radiusV, color)


def DrawEllipseLines(
    centerX: Int32,
    centerY: Int32,
    radiusH: Float32,
    radiusV: Float32,
    color: Color,
):
    external_call["DrawEllipseLines", NoneType](
        centerX, centerY, radiusH, radiusV, color
    )


def DrawEllipseLinesV(
    center: Vector2, radiusH: Float32, radiusV: Float32, color: Color
):
    external_call["DrawEllipseLinesV", NoneType](
        center, radiusH, radiusV, color
    )


def DrawRing(
    center: Vector2,
    innerRadius: Float32,
    outerRadius: Float32,
    startAngle: Float32,
    endAngle: Float32,
    segments: Int32,
    color: Color,
):
    external_call["DrawRing", NoneType](
        center, innerRadius, outerRadius, startAngle, endAngle, segments, color
    )


def DrawRingLines(
    center: Vector2,
    innerRadius: Float32,
    outerRadius: Float32,
    startAngle: Float32,
    endAngle: Float32,
    segments: Int32,
    color: Color,
):
    external_call["DrawRingLines", NoneType](
        center, innerRadius, outerRadius, startAngle, endAngle, segments, color
    )


def DrawSplineLinear(
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineLinear", NoneType](
        points, pointCount, thick, color
    )


def DrawSplineBasis(
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineBasis", NoneType](points, pointCount, thick, color)


def DrawSplineCatmullRom(
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineCatmullRom", NoneType](
        points, pointCount, thick, color
    )


def DrawSplineBezierQuadratic(
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineBezierQuadratic", NoneType](
        points, pointCount, thick, color
    )


def DrawSplineBezierCubic(
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineBezierCubic", NoneType](
        points, pointCount, thick, color
    )


def DrawSplineSegmentLinear(
    p1: Vector2, p2: Vector2, thick: Float32, color: Color
):
    external_call["DrawSplineSegmentLinear", NoneType](p1, p2, thick, color)


def DrawSplineSegmentBasis(
    p1: Vector2,
    p2: Vector2,
    p3: Vector2,
    p4: Vector2,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineSegmentBasis", NoneType](
        p1, p2, p3, p4, thick, color
    )


def DrawSplineSegmentCatmullRom(
    p1: Vector2,
    p2: Vector2,
    p3: Vector2,
    p4: Vector2,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineSegmentCatmullRom", NoneType](
        p1, p2, p3, p4, thick, color
    )


def DrawSplineSegmentBezierQuadratic(
    p1: Vector2, c2: Vector2, p3: Vector2, thick: Float32, color: Color
):
    external_call["DrawSplineSegmentBezierQuadratic", NoneType](
        p1, c2, p3, thick, color
    )


def DrawSplineSegmentBezierCubic(
    p1: Vector2,
    c2: Vector2,
    c3: Vector2,
    p4: Vector2,
    thick: Float32,
    color: Color,
):
    external_call["DrawSplineSegmentBezierCubic", NoneType](
        p1, c2, c3, p4, thick, color
    )


def GetSplinePointLinear(
    startPos: Vector2, endPos: Vector2, t: Float32
) -> Vector2:
    return external_call["GetSplinePointLinear", Vector2](startPos, endPos, t)


def GetSplinePointBasis(
    p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: Float32
) -> Vector2:
    return external_call["GetSplinePointBasis", Vector2](p1, p2, p3, p4, t)


def GetSplinePointCatmullRom(
    p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2, t: Float32
) -> Vector2:
    return external_call["GetSplinePointCatmullRom", Vector2](p1, p2, p3, p4, t)


def GetSplinePointBezierQuadratic(
    p1: Vector2, c2: Vector2, p3: Vector2, t: Float32
) -> Vector2:
    return external_call["GetSplinePointBezierQuadratic", Vector2](
        p1, c2, p3, t
    )


def GetSplinePointBezierCubic(
    p1: Vector2, c2: Vector2, c3: Vector2, p4: Vector2, t: Float32
) -> Vector2:
    return external_call["GetSplinePointBezierCubic", Vector2](
        p1, c2, c3, p4, t
    )


def CheckCollisionRecs(rec1: Rectangle, rec2: Rectangle) -> Bool:
    return external_call["CheckCollisionRecs", Bool](rec1, rec2)


def CheckCollisionCircles(
    center1: Vector2, radius1: Float32, center2: Vector2, radius2: Float32
) -> Bool:
    return external_call["CheckCollisionCircles", Bool](
        center1, radius1, center2, radius2
    )


def CheckCollisionCircleRec(
    center: Vector2, radius: Float32, rec: Rectangle
) -> Bool:
    return external_call["CheckCollisionCircleRec", Bool](center, radius, rec)


def CheckCollisionCircleLine(
    center: Vector2, radius: Float32, p1: Vector2, p2: Vector2
) -> Bool:
    return external_call["CheckCollisionCircleLine", Bool](
        center, radius, p1, p2
    )


def CheckCollisionPointRec(point: Vector2, rec: Rectangle) -> Bool:
    return external_call["CheckCollisionPointRec", Bool](point, rec)


def CheckCollisionPointCircle(
    point: Vector2, center: Vector2, radius: Float32
) -> Bool:
    return external_call["CheckCollisionPointCircle", Bool](
        point, center, radius
    )


def CheckCollisionPointTriangle(
    point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2
) -> Bool:
    return external_call["CheckCollisionPointTriangle", Bool](point, p1, p2, p3)


def CheckCollisionPointLine(
    point: Vector2, p1: Vector2, p2: Vector2, threshold: Int32
) -> Bool:
    return external_call["CheckCollisionPointLine", Bool](
        point, p1, p2, threshold
    )


def CheckCollisionPointPoly(
    point: Vector2, points: Pointer[Vector2, origin=_], pointCount: Int32
) -> Bool:
    return external_call["CheckCollisionPointPoly", Bool](
        point, points, pointCount
    )


def CheckCollisionLines(
    startPos1: Vector2,
    endPos1: Vector2,
    startPos2: Vector2,
    endPos2: Vector2,
    collisionPoint: Pointer[Vector2, origin=_],
) -> Bool:
    return external_call["CheckCollisionLines", Bool](
        startPos1, endPos1, startPos2, endPos2, collisionPoint
    )


def GetCollisionRec(rec1: Rectangle, rec2: Rectangle) -> Rectangle:
    return external_call["GetCollisionRec", Rectangle](rec1, rec2)


def LoadImage(fileName: Pointer[UInt8, origin=_]) -> Image:
    return external_call["LoadImage", Image](fileName)


def LoadImageRaw(
    fileName: Pointer[UInt8, origin=_],
    width: Int32,
    height: Int32,
    format: Int32,
    headerSize: Int32,
) -> Image:
    return external_call["LoadImageRaw", Image](
        fileName, width, height, format, headerSize
    )


def LoadImageAnim(
    fileName: Pointer[UInt8, origin=_], frames: Pointer[Int32, origin=_]
) -> Image:
    return external_call["LoadImageAnim", Image](fileName, frames)


def LoadImageAnimFromMemory(
    fileType: Pointer[UInt8, origin=_],
    fileData: Pointer[UInt8, origin=_],
    dataSize: Int32,
    frames: Pointer[Int32, origin=_],
) -> Image:
    return external_call["LoadImageAnimFromMemory", Image](
        fileType, fileData, dataSize, frames
    )


def LoadImageFromMemory(
    fileType: Pointer[UInt8, origin=_],
    fileData: Pointer[UInt8, origin=_],
    dataSize: Int32,
) -> Image:
    return external_call["LoadImageFromMemory", Image](
        fileType, fileData, dataSize
    )


def LoadImageFromTexture(texture: Texture) -> Image:
    return external_call["LoadImageFromTexture", Image](texture)


def LoadImageFromScreen() -> Image:
    return external_call["LoadImageFromScreen", Image]()


def IsImageValid(image: Image) -> Bool:
    return external_call["IsImageValid", Bool](image)


def UnloadImage(image: Image):
    external_call["UnloadImage", NoneType](image)


def ExportImage(image: Image, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportImage", Bool](image, fileName)


def ExportImageToMemory(
    image: Image,
    fileType: Pointer[UInt8, origin=_],
    fileSize: Pointer[Int32, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["ExportImageToMemory", Pointer[UInt8, origin=_]](
        image, fileType, fileSize
    )


def ExportImageAsCode(image: Image, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportImageAsCode", Bool](image, fileName)


def GenImageColor(width: Int32, height: Int32, color: Color) -> Image:
    return external_call["GenImageColor", Image](width, height, color)


def GenImageGradientLinear(
    width: Int32, height: Int32, direction: Int32, start: Color, end: Color
) -> Image:
    return external_call["GenImageGradientLinear", Image](
        width, height, direction, start, end
    )


def GenImageGradientRadial(
    width: Int32, height: Int32, density: Float32, inner: Color, outer: Color
) -> Image:
    return external_call["GenImageGradientRadial", Image](
        width, height, density, inner, outer
    )


def GenImageGradientSquare(
    width: Int32, height: Int32, density: Float32, inner: Color, outer: Color
) -> Image:
    return external_call["GenImageGradientSquare", Image](
        width, height, density, inner, outer
    )


def GenImageChecked(
    width: Int32,
    height: Int32,
    checksX: Int32,
    checksY: Int32,
    col1: Color,
    col2: Color,
) -> Image:
    return external_call["GenImageChecked", Image](
        width, height, checksX, checksY, col1, col2
    )


def GenImageWhiteNoise(width: Int32, height: Int32, factor: Float32) -> Image:
    return external_call["GenImageWhiteNoise", Image](width, height, factor)


def GenImagePerlinNoise(
    width: Int32, height: Int32, offsetX: Int32, offsetY: Int32, scale: Float32
) -> Image:
    return external_call["GenImagePerlinNoise", Image](
        width, height, offsetX, offsetY, scale
    )


def GenImageCellular(width: Int32, height: Int32, tileSize: Int32) -> Image:
    return external_call["GenImageCellular", Image](width, height, tileSize)


def GenImageText(
    width: Int32, height: Int32, text: Pointer[UInt8, origin=_]
) -> Image:
    return external_call["GenImageText", Image](width, height, text)


def ImageCopy(image: Image) -> Image:
    return external_call["ImageCopy", Image](image)


def ImageFromImage(image: Image, rec: Rectangle) -> Image:
    return external_call["ImageFromImage", Image](image, rec)


def ImageFromChannel(image: Image, selectedChannel: Int32) -> Image:
    return external_call["ImageFromChannel", Image](image, selectedChannel)


def ImageText(
    text: Pointer[UInt8, origin=_], fontSize: Int32, color: Color
) -> Image:
    return external_call["ImageText", Image](text, fontSize, color)


def ImageTextEx(
    font: Font,
    text: Pointer[UInt8, origin=_],
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
) -> Image:
    return external_call["ImageTextEx", Image](
        font, text, fontSize, spacing, tint
    )


def ImageFormat(image: Pointer[Image, origin=_], newFormat: Int32):
    external_call["ImageFormat", NoneType](image, newFormat)


def ImageToPOT(image: Pointer[Image, origin=_], fill: Color):
    external_call["ImageToPOT", NoneType](image, fill)


def ImageCrop(image: Pointer[Image, origin=_], crop: Rectangle):
    external_call["ImageCrop", NoneType](image, crop)


def ImageAlphaCrop(image: Pointer[Image, origin=_], threshold: Float32):
    external_call["ImageAlphaCrop", NoneType](image, threshold)


def ImageAlphaClear(
    image: Pointer[Image, origin=_], color: Color, threshold: Float32
):
    external_call["ImageAlphaClear", NoneType](image, color, threshold)


def ImageAlphaMask(image: Pointer[Image, origin=_], alphaMask: Image):
    external_call["ImageAlphaMask", NoneType](image, alphaMask)


def ImageAlphaPremultiply(image: Pointer[Image, origin=_]):
    external_call["ImageAlphaPremultiply", NoneType](image)


def ImageBlurGaussian(image: Pointer[Image, origin=_], blurSize: Int32):
    external_call["ImageBlurGaussian", NoneType](image, blurSize)


def ImageKernelConvolution(
    image: Pointer[Image, origin=_],
    kernel: Pointer[Float32, origin=_],
    kernelSize: Int32,
):
    external_call["ImageKernelConvolution", NoneType](image, kernel, kernelSize)


def ImageResize(
    image: Pointer[Image, origin=_], newWidth: Int32, newHeight: Int32
):
    external_call["ImageResize", NoneType](image, newWidth, newHeight)


def ImageResizeNN(
    image: Pointer[Image, origin=_], newWidth: Int32, newHeight: Int32
):
    external_call["ImageResizeNN", NoneType](image, newWidth, newHeight)


def ImageResizeCanvas(
    image: Pointer[Image, origin=_],
    newWidth: Int32,
    newHeight: Int32,
    offsetX: Int32,
    offsetY: Int32,
    fill: Color,
):
    external_call["ImageResizeCanvas", NoneType](
        image, newWidth, newHeight, offsetX, offsetY, fill
    )


def ImageMipmaps(image: Pointer[Image, origin=_]):
    external_call["ImageMipmaps", NoneType](image)


def ImageDither(
    image: Pointer[Image, origin=_],
    rBpp: Int32,
    gBpp: Int32,
    bBpp: Int32,
    aBpp: Int32,
):
    external_call["ImageDither", NoneType](image, rBpp, gBpp, bBpp, aBpp)


def ImageFlipVertical(image: Pointer[Image, origin=_]):
    external_call["ImageFlipVertical", NoneType](image)


def ImageFlipHorizontal(image: Pointer[Image, origin=_]):
    external_call["ImageFlipHorizontal", NoneType](image)


def ImageRotate(image: Pointer[Image, origin=_], degrees: Int32):
    external_call["ImageRotate", NoneType](image, degrees)


def ImageRotateCW(image: Pointer[Image, origin=_]):
    external_call["ImageRotateCW", NoneType](image)


def ImageRotateCCW(image: Pointer[Image, origin=_]):
    external_call["ImageRotateCCW", NoneType](image)


def ImageColorTint(image: Pointer[Image, origin=_], color: Color):
    external_call["ImageColorTint", NoneType](image, color)


def ImageColorInvert(image: Pointer[Image, origin=_]):
    external_call["ImageColorInvert", NoneType](image)


def ImageColorGrayscale(image: Pointer[Image, origin=_]):
    external_call["ImageColorGrayscale", NoneType](image)


def ImageColorContrast(image: Pointer[Image, origin=_], contrast: Int32):
    external_call["ImageColorContrast", NoneType](image, contrast)


def ImageColorBrightness(image: Pointer[Image, origin=_], brightness: Int32):
    external_call["ImageColorBrightness", NoneType](image, brightness)


def ImageColorReplace(
    image: Pointer[Image, origin=_], color: Color, replace: Color
):
    external_call["ImageColorReplace", NoneType](image, color, replace)


def LoadImageColors(image: Image) -> Pointer[Color, origin=_]:
    return external_call["LoadImageColors", Pointer[Color, origin=_]](image)


def LoadImagePalette(
    image: Image, maxPaletteSize: Int32, colorCount: Pointer[Int32, origin=_]
) -> Pointer[Color, origin=_]:
    return external_call["LoadImagePalette", Pointer[Color, origin=_]](
        image, maxPaletteSize, colorCount
    )


def UnloadImageColors(colors: Pointer[Color, origin=_]):
    external_call["UnloadImageColors", NoneType](colors)


def UnloadImagePalette(colors: Pointer[Color, origin=_]):
    external_call["UnloadImagePalette", NoneType](colors)


def GetImageAlphaBorder(image: Image, threshold: Float32) -> Rectangle:
    return external_call["GetImageAlphaBorder", Rectangle](image, threshold)


def GetImageColor(image: Image, x: Int32, y: Int32) -> Color:
    return external_call["GetImageColor", Color](image, x, y)


def ImageClearBackground(dst: Pointer[Image, origin=_], color: Color):
    external_call["ImageClearBackground", NoneType](dst, color)


def ImageDrawPixel(
    dst: Pointer[Image, origin=_], posX: Int32, posY: Int32, color: Color
):
    external_call["ImageDrawPixel", NoneType](dst, posX, posY, color)


def ImageDrawPixelV(
    dst: Pointer[Image, origin=_], position: Vector2, color: Color
):
    external_call["ImageDrawPixelV", NoneType](dst, position, color)


def ImageDrawLine(
    dst: Pointer[Image, origin=_],
    startPosX: Int32,
    startPosY: Int32,
    endPosX: Int32,
    endPosY: Int32,
    color: Color,
):
    external_call["ImageDrawLine", NoneType](
        dst, startPosX, startPosY, endPosX, endPosY, color
    )


def ImageDrawLineV(
    dst: Pointer[Image, origin=_], start: Vector2, end: Vector2, color: Color
):
    external_call["ImageDrawLineV", NoneType](dst, start, end, color)


def ImageDrawLineEx(
    dst: Pointer[Image, origin=_],
    start: Vector2,
    end: Vector2,
    thick: Int32,
    color: Color,
):
    external_call["ImageDrawLineEx", NoneType](dst, start, end, thick, color)


def ImageDrawLineStrip(
    dst: Pointer[Image, origin=_],
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    color: Color,
):
    external_call["ImageDrawLineStrip", NoneType](
        dst, points, pointCount, color
    )


def ImageDrawTriangle(
    dst: Pointer[Image, origin=_],
    v1: Vector2,
    v2: Vector2,
    v3: Vector2,
    color: Color,
):
    external_call["ImageDrawTriangle", NoneType](dst, v1, v2, v3, color)


def ImageDrawTriangleGradient(
    dst: Pointer[Image, origin=_],
    v1: Vector2,
    v2: Vector2,
    v3: Vector2,
    c1: Color,
    c2: Color,
    c3: Color,
):
    external_call["ImageDrawTriangleGradient", NoneType](
        dst, v1, v2, v3, c1, c2, c3
    )


def ImageDrawTriangleLines(
    dst: Pointer[Image, origin=_],
    v1: Vector2,
    v2: Vector2,
    v3: Vector2,
    color: Color,
):
    external_call["ImageDrawTriangleLines", NoneType](dst, v1, v2, v3, color)


def ImageDrawTriangleFan(
    dst: Pointer[Image, origin=_],
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    color: Color,
):
    external_call["ImageDrawTriangleFan", NoneType](
        dst, points, pointCount, color
    )


def ImageDrawTriangleStrip(
    dst: Pointer[Image, origin=_],
    points: Pointer[Vector2, origin=_],
    pointCount: Int32,
    color: Color,
):
    external_call["ImageDrawTriangleStrip", NoneType](
        dst, points, pointCount, color
    )


def ImageDrawRectangle(
    dst: Pointer[Image, origin=_],
    posX: Int32,
    posY: Int32,
    width: Int32,
    height: Int32,
    color: Color,
):
    external_call["ImageDrawRectangle", NoneType](
        dst, posX, posY, width, height, color
    )


def ImageDrawRectangleV(
    dst: Pointer[Image, origin=_],
    position: Vector2,
    size: Vector2,
    color: Color,
):
    external_call["ImageDrawRectangleV", NoneType](dst, position, size, color)


def ImageDrawRectangleRec(
    dst: Pointer[Image, origin=_], rec: Rectangle, color: Color
):
    external_call["ImageDrawRectangleRec", NoneType](dst, rec, color)


def ImageDrawRectanglePro(
    dst: Pointer[Image, origin=_],
    rec: Rectangle,
    origin: Vector2,
    rotation: Float32,
    color: Color,
):
    external_call["ImageDrawRectanglePro", NoneType](
        dst, rec, origin, rotation, color
    )


def ImageDrawRectangleLines(
    dst: Pointer[Image, origin=_],
    posX: Int32,
    posY: Int32,
    width: Int32,
    height: Int32,
    color: Color,
):
    external_call["ImageDrawRectangleLines", NoneType](
        dst, posX, posY, width, height, color
    )


def ImageDrawRectangleLinesEx(
    dst: Pointer[Image, origin=_], rec: Rectangle, thick: Int32, color: Color
):
    external_call["ImageDrawRectangleLinesEx", NoneType](dst, rec, thick, color)


def ImageDrawRectangleGradientEx(
    dst: Pointer[Image, origin=_],
    rec: Rectangle,
    col1: Color,
    col2: Color,
    col3: Color,
    col4: Color,
):
    external_call["ImageDrawRectangleGradientEx", NoneType](
        dst, rec, col1, col2, col3, col4
    )


def ImageDrawCircle(
    dst: Pointer[Image, origin=_],
    centerX: Int32,
    centerY: Int32,
    radius: Int32,
    color: Color,
):
    external_call["ImageDrawCircle", NoneType](
        dst, centerX, centerY, radius, color
    )


def ImageDrawCircleV(
    dst: Pointer[Image, origin=_], center: Vector2, radius: Int32, color: Color
):
    external_call["ImageDrawCircleV", NoneType](dst, center, radius, color)


def ImageDrawCircleLines(
    dst: Pointer[Image, origin=_],
    centerX: Int32,
    centerY: Int32,
    radius: Int32,
    color: Color,
):
    external_call["ImageDrawCircleLines", NoneType](
        dst, centerX, centerY, radius, color
    )


def ImageDrawCircleLinesV(
    dst: Pointer[Image, origin=_], center: Vector2, radius: Int32, color: Color
):
    external_call["ImageDrawCircleLinesV", NoneType](dst, center, radius, color)


def ImageDrawCircleGradient(
    dst: Pointer[Image, origin=_],
    center: Vector2,
    radius: Float32,
    inner: Color,
    outer: Color,
):
    external_call["ImageDrawCircleGradient", NoneType](
        dst, center, radius, inner, outer
    )


def ImageDrawImage(
    dst: Pointer[Image, origin=_],
    src: Image,
    posX: Int32,
    posY: Int32,
    tint: Color,
):
    external_call["ImageDrawImage", NoneType](dst, src, posX, posY, tint)


def ImageDrawImageEx(
    dst: Pointer[Image, origin=_],
    src: Image,
    position: Vector2,
    rotation: Float32,
    scale: Float32,
    tint: Color,
):
    external_call["ImageDrawImageEx", NoneType](
        dst, src, position, rotation, scale, tint
    )


def ImageDrawImageRec(
    dst: Pointer[Image, origin=_],
    src: Image,
    srcRec: Rectangle,
    position: Vector2,
    tint: Color,
):
    external_call["ImageDrawImageRec", NoneType](
        dst, src, srcRec, position, tint
    )


def ImageDrawImagePro(
    dst: Pointer[Image, origin=_],
    src: Image,
    srcRec: Rectangle,
    dstRec: Rectangle,
    origin: Vector2,
    rotation: Float32,
    tint: Color,
):
    external_call["ImageDrawImagePro", NoneType](
        dst, src, srcRec, dstRec, origin, rotation, tint
    )


def ImageDrawText(
    dst: Pointer[Image, origin=_],
    text: Pointer[UInt8, origin=_],
    posX: Int32,
    posY: Int32,
    fontSize: Int32,
    color: Color,
):
    external_call["ImageDrawText", NoneType](
        dst, text, posX, posY, fontSize, color
    )


def ImageDrawTextEx(
    dst: Pointer[Image, origin=_],
    font: Font,
    text: Pointer[UInt8, origin=_],
    position: Vector2,
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
):
    external_call["ImageDrawTextEx", NoneType](
        dst, font, text, position, fontSize, spacing, tint
    )


def ImageDrawTextPro(
    dst: Pointer[Image, origin=_],
    font: Font,
    text: Pointer[UInt8, origin=_],
    position: Vector2,
    origin: Vector2,
    rotation: Float32,
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
):
    external_call["ImageDrawTextPro", NoneType](
        dst, font, text, position, origin, rotation, fontSize, spacing, tint
    )


def LoadTexture(fileName: Pointer[UInt8, origin=_]) -> Texture:
    return external_call["LoadTexture", Texture](fileName)


def LoadTextureFromImage(image: Image) -> Texture:
    return external_call["LoadTextureFromImage", Texture](image)


def LoadTextureCubemap(image: Image, layout: Int32) -> Texture:
    return external_call["LoadTextureCubemap", Texture](image, layout)


def LoadRenderTexture(width: Int32, height: Int32) -> RenderTexture:
    return external_call["LoadRenderTexture", RenderTexture](width, height)


def IsTextureValid(texture: Texture) -> Bool:
    return external_call["IsTextureValid", Bool](texture)


def UnloadTexture(texture: Texture):
    external_call["UnloadTexture", NoneType](texture)


def IsRenderTextureValid(target: RenderTexture) -> Bool:
    return external_call["IsRenderTextureValid", Bool](target)


def UnloadRenderTexture(target: RenderTexture):
    external_call["UnloadRenderTexture", NoneType](target)


def UpdateTexture(texture: Texture, pixels: Pointer[NoneType, origin=_]):
    external_call["UpdateTexture", NoneType](texture, pixels)


def UpdateTextureRec(
    texture: Texture, rec: Rectangle, pixels: Pointer[NoneType, origin=_]
):
    external_call["UpdateTextureRec", NoneType](texture, rec, pixels)


def GenTextureMipmaps(texture: Pointer[Texture, origin=_]):
    external_call["GenTextureMipmaps", NoneType](texture)


def SetTextureFilter(texture: Texture, filter: Int32):
    external_call["SetTextureFilter", NoneType](texture, filter)


def SetTextureWrap(texture: Texture, wrap: Int32):
    external_call["SetTextureWrap", NoneType](texture, wrap)


def DrawTexture(texture: Texture, posX: Int32, posY: Int32, tint: Color):
    external_call["DrawTexture", NoneType](texture, posX, posY, tint)


def DrawTextureV(texture: Texture, position: Vector2, tint: Color):
    external_call["DrawTextureV", NoneType](texture, position, tint)


def DrawTextureEx(
    texture: Texture,
    position: Vector2,
    rotation: Float32,
    scale: Float32,
    tint: Color,
):
    external_call["DrawTextureEx", NoneType](
        texture, position, rotation, scale, tint
    )


def DrawTextureRec(
    texture: Texture, rec: Rectangle, position: Vector2, tint: Color
):
    external_call["DrawTextureRec", NoneType](texture, rec, position, tint)


def DrawTexturePro(
    texture: Texture,
    srcrec: Rectangle,
    dstrec: Rectangle,
    origin: Vector2,
    rotation: Float32,
    tint: Color,
):
    external_call["DrawTexturePro", NoneType](
        texture, srcrec, dstrec, origin, rotation, tint
    )


def DrawTextureNPatch(
    texture: Texture,
    nPatchInfo: NPatchInfo,
    dstrec: Rectangle,
    origin: Vector2,
    rotation: Float32,
    tint: Color,
):
    external_call["DrawTextureNPatch", NoneType](
        texture, nPatchInfo, dstrec, origin, rotation, tint
    )


def ColorIsEqual(col1: Color, col2: Color) -> Bool:
    return external_call["ColorIsEqual", Bool](col1, col2)


def Fade(color: Color, alpha: Float32) -> Color:
    return external_call["Fade", Color](color, alpha)


def ColorToInt(color: Color) -> Int32:
    return external_call["ColorToInt", Int32](color)


def ColorNormalize(color: Color) -> Vector4:
    return external_call["ColorNormalize", Vector4](color)


def ColorFromNormalized(normalized: Vector4) -> Color:
    return external_call["ColorFromNormalized", Color](normalized)


def ColorToHSV(color: Color) -> Vector3:
    return external_call["ColorToHSV", Vector3](color)


def ColorFromHSV(hue: Float32, saturation: Float32, value: Float32) -> Color:
    return external_call["ColorFromHSV", Color](hue, saturation, value)


def ColorTint(color: Color, tint: Color) -> Color:
    return external_call["ColorTint", Color](color, tint)


def ColorBrightness(color: Color, factor: Float32) -> Color:
    return external_call["ColorBrightness", Color](color, factor)


def ColorContrast(color: Color, contrast: Float32) -> Color:
    return external_call["ColorContrast", Color](color, contrast)


def ColorAlpha(color: Color, alpha: Float32) -> Color:
    return external_call["ColorAlpha", Color](color, alpha)


def ColorAlphaBlend(dst: Color, src: Color, tint: Color) -> Color:
    return external_call["ColorAlphaBlend", Color](dst, src, tint)


def ColorLerp(color1: Color, color2: Color, factor: Float32) -> Color:
    return external_call["ColorLerp", Color](color1, color2, factor)


def GetColor(hexValue: UInt32) -> Color:
    return external_call["GetColor", Color](hexValue)


def GetPixelColor(srcPtr: Pointer[NoneType, origin=_], format: Int32) -> Color:
    return external_call["GetPixelColor", Color](srcPtr, format)


def SetPixelColor(
    dstPtr: Pointer[NoneType, origin=_], color: Color, format: Int32
):
    external_call["SetPixelColor", NoneType](dstPtr, color, format)


def GetPixelDataSize(width: Int32, height: Int32, format: Int32) -> Int32:
    return external_call["GetPixelDataSize", Int32](width, height, format)


def GetFontDefault() -> Font:
    return external_call["GetFontDefault", Font]()


def LoadFont(fileName: Pointer[UInt8, origin=_]) -> Font:
    return external_call["LoadFont", Font](fileName)


def LoadFontEx(
    fileName: Pointer[UInt8, origin=_],
    fontSize: Int32,
    codepoints: Pointer[Int32, origin=_],
    codepointCount: Int32,
) -> Font:
    return external_call["LoadFontEx", Font](
        fileName, fontSize, codepoints, codepointCount
    )


def LoadFontFromImage(image: Image, key: Color, firstChar: Int32) -> Font:
    return external_call["LoadFontFromImage", Font](image, key, firstChar)


def LoadFontFromMemory(
    fileType: Pointer[UInt8, origin=_],
    fileData: Pointer[UInt8, origin=_],
    dataSize: Int32,
    fontSize: Int32,
    codepoints: Pointer[Int32, origin=_],
    codepointCount: Int32,
) -> Font:
    return external_call["LoadFontFromMemory", Font](
        fileType, fileData, dataSize, fontSize, codepoints, codepointCount
    )


def IsFontValid(font: Font) -> Bool:
    return external_call["IsFontValid", Bool](font)


def LoadFontData(
    fileData: Pointer[UInt8, origin=_],
    dataSize: Int32,
    fontSize: Int32,
    codepoints: Pointer[Int32, origin=_],
    codepointCount: Int32,
    type_: Int32,
    glyphCount: Pointer[Int32, origin=_],
) -> Pointer[GlyphInfo, origin=_]:
    return external_call["LoadFontData", Pointer[GlyphInfo, origin=_]](
        fileData,
        dataSize,
        fontSize,
        codepoints,
        codepointCount,
        type_,
        glyphCount,
    )


def GenImageFontAtlas(
    glyphs: Pointer[GlyphInfo, origin=_],
    glyphRecs: Pointer[Pointer[Rectangle, origin=_], origin=_],
    glyphCount: Int32,
    fontSize: Int32,
    padding: Int32,
    packMethod: Int32,
) -> Image:
    return external_call["GenImageFontAtlas", Image](
        glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod
    )


def UnloadFontData(glyphs: Pointer[GlyphInfo, origin=_], glyphCount: Int32):
    external_call["UnloadFontData", NoneType](glyphs, glyphCount)


def UnloadFont(font: Font):
    external_call["UnloadFont", NoneType](font)


def ExportFontAsCode(font: Font, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportFontAsCode", Bool](font, fileName)


def DrawFPS(posX: Int32, posY: Int32):
    external_call["DrawFPS", NoneType](posX, posY)


def DrawText(
    text: Pointer[UInt8, origin=_],
    posX: Int32,
    posY: Int32,
    fontSize: Int32,
    color: Color,
):
    external_call["DrawText", NoneType](text, posX, posY, fontSize, color)


def DrawTextEx(
    font: Font,
    text: Pointer[UInt8, origin=_],
    position: Vector2,
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
):
    external_call["DrawTextEx", NoneType](
        font, text, position, fontSize, spacing, tint
    )


def DrawTextPro(
    font: Font,
    text: Pointer[UInt8, origin=_],
    position: Vector2,
    origin: Vector2,
    rotation: Float32,
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
):
    external_call["DrawTextPro", NoneType](
        font, text, position, origin, rotation, fontSize, spacing, tint
    )


def DrawTextCodepoint(
    font: Font,
    codepoint: Int32,
    position: Vector2,
    fontSize: Float32,
    tint: Color,
):
    external_call["DrawTextCodepoint", NoneType](
        font, codepoint, position, fontSize, tint
    )


def DrawTextCodepoints(
    font: Font,
    codepoints: Pointer[Int32, origin=_],
    codepointCount: Int32,
    position: Vector2,
    fontSize: Float32,
    spacing: Float32,
    tint: Color,
):
    external_call["DrawTextCodepoints", NoneType](
        font, codepoints, codepointCount, position, fontSize, spacing, tint
    )


def SetTextLineSpacing(spacing: Int32):
    external_call["SetTextLineSpacing", NoneType](spacing)


def MeasureText(text: Pointer[UInt8, origin=_], fontSize: Int32) -> Int32:
    return external_call["MeasureText", Int32](text, fontSize)


def MeasureTextEx(
    font: Font,
    text: Pointer[UInt8, origin=_],
    fontSize: Float32,
    spacing: Float32,
) -> Vector2:
    return external_call["MeasureTextEx", Vector2](
        font, text, fontSize, spacing
    )


def MeasureTextCodepoints(
    font: Font,
    codepoints: Pointer[Int32, origin=_],
    length: Int32,
    fontSize: Float32,
    spacing: Float32,
) -> Vector2:
    return external_call["MeasureTextCodepoints", Vector2](
        font, codepoints, length, fontSize, spacing
    )


def GetGlyphIndex(font: Font, codepoint: Int32) -> Int32:
    return external_call["GetGlyphIndex", Int32](font, codepoint)


def GetGlyphInfo(font: Font, codepoint: Int32) -> GlyphInfo:
    return external_call["GetGlyphInfo", GlyphInfo](font, codepoint)


def GetGlyphAtlasRec(font: Font, codepoint: Int32) -> Rectangle:
    return external_call["GetGlyphAtlasRec", Rectangle](font, codepoint)


def LoadUTF8(
    codepoints: Pointer[Int32, origin=_], length: Int32
) -> Pointer[UInt8, origin=_]:
    return external_call["LoadUTF8", Pointer[UInt8, origin=_]](
        codepoints, length
    )


def UnloadUTF8(text: Pointer[UInt8, origin=_]):
    external_call["UnloadUTF8", NoneType](text)


def LoadCodepoints(
    text: Pointer[UInt8, origin=_], count: Pointer[Int32, origin=_]
) -> Pointer[Int32, origin=_]:
    return external_call["LoadCodepoints", Pointer[Int32, origin=_]](
        text, count
    )


def UnloadCodepoints(codepoints: Pointer[Int32, origin=_]):
    external_call["UnloadCodepoints", NoneType](codepoints)


def GetCodepointCount(text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["GetCodepointCount", Int32](text)


def GetCodepoint(
    text: Pointer[UInt8, origin=_], codepointSize: Pointer[Int32, origin=_]
) -> Int32:
    return external_call["GetCodepoint", Int32](text, codepointSize)


def GetCodepointNext(
    text: Pointer[UInt8, origin=_], codepointSize: Pointer[Int32, origin=_]
) -> Int32:
    return external_call["GetCodepointNext", Int32](text, codepointSize)


def GetCodepointPrevious(
    text: Pointer[UInt8, origin=_], codepointSize: Pointer[Int32, origin=_]
) -> Int32:
    return external_call["GetCodepointPrevious", Int32](text, codepointSize)


def CodepointToUTF8(
    codepoint: Int32, utf8Size: Pointer[Int32, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["CodepointToUTF8", Pointer[UInt8, origin=_]](
        codepoint, utf8Size
    )


def LoadTextLines(
    text: Pointer[UInt8, origin=_], count: Pointer[Int32, origin=_]
) -> Pointer[Pointer[UInt8, origin=_], origin=_]:
    return external_call[
        "LoadTextLines", Pointer[Pointer[UInt8, origin=_], origin=_]
    ](text, count)


def UnloadTextLines(
    text: Pointer[Pointer[UInt8, origin=_], origin=_], lineCount: Int32
):
    external_call["UnloadTextLines", NoneType](text, lineCount)


def TextCopy(
    dst: Pointer[UInt8, origin=_], src: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["TextCopy", Int32](dst, src)


def TextIsEqual(
    text1: Pointer[UInt8, origin=_], text2: Pointer[UInt8, origin=_]
) -> Bool:
    return external_call["TextIsEqual", Bool](text1, text2)


def TextLength(text: Pointer[UInt8, origin=_]) -> UInt32:
    return external_call["TextLength", UInt32](text)


def TextFormat(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextFormat", Pointer[UInt8, origin=_]](text)


def TextSubtext(
    text: Pointer[UInt8, origin=_], position: Int32, length: Int32
) -> Pointer[UInt8, origin=_]:
    return external_call["TextSubtext", Pointer[UInt8, origin=_]](
        text, position, length
    )


def TextRemoveSpaces(
    text: Pointer[UInt8, origin=_]
) -> Pointer[UInt8, origin=_]:
    return external_call["TextRemoveSpaces", Pointer[UInt8, origin=_]](text)


def GetTextBetween(
    text: Pointer[UInt8, origin=_],
    begin: Pointer[UInt8, origin=_],
    end: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["GetTextBetween", Pointer[UInt8, origin=_]](
        text, begin, end
    )


def TextReplace(
    text: Pointer[UInt8, origin=_],
    search: Pointer[UInt8, origin=_],
    replacement: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["TextReplace", Pointer[UInt8, origin=_]](
        text, search, replacement
    )


def TextReplaceAlloc(
    text: Pointer[UInt8, origin=_],
    search: Pointer[UInt8, origin=_],
    replacement: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["TextReplaceAlloc", Pointer[UInt8, origin=_]](
        text, search, replacement
    )


def TextReplaceBetween(
    text: Pointer[UInt8, origin=_],
    begin: Pointer[UInt8, origin=_],
    end: Pointer[UInt8, origin=_],
    replacement: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["TextReplaceBetween", Pointer[UInt8, origin=_]](
        text, begin, end, replacement
    )


def TextReplaceBetweenAlloc(
    text: Pointer[UInt8, origin=_],
    begin: Pointer[UInt8, origin=_],
    end: Pointer[UInt8, origin=_],
    replacement: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["TextReplaceBetweenAlloc", Pointer[UInt8, origin=_]](
        text, begin, end, replacement
    )


def TextInsert(
    text: Pointer[UInt8, origin=_],
    insert: Pointer[UInt8, origin=_],
    position: Int32,
) -> Pointer[UInt8, origin=_]:
    return external_call["TextInsert", Pointer[UInt8, origin=_]](
        text, insert, position
    )


def TextInsertAlloc(
    text: Pointer[UInt8, origin=_],
    insert: Pointer[UInt8, origin=_],
    position: Int32,
) -> Pointer[UInt8, origin=_]:
    return external_call["TextInsertAlloc", Pointer[UInt8, origin=_]](
        text, insert, position
    )


def TextJoin(
    textList: Pointer[Pointer[UInt8, origin=_], origin=_],
    count: Int32,
    delimiter: Pointer[UInt8, origin=_],
) -> Pointer[UInt8, origin=_]:
    return external_call["TextJoin", Pointer[UInt8, origin=_]](
        textList, count, delimiter
    )


def TextSplit(
    text: Pointer[UInt8, origin=_],
    delimiter: Int8,
    count: Pointer[Int32, origin=_],
) -> Pointer[Pointer[UInt8, origin=_], origin=_]:
    return external_call[
        "TextSplit", Pointer[Pointer[UInt8, origin=_], origin=_]
    ](text, delimiter, count)


def TextAppend(
    text: Pointer[UInt8, origin=_],
    append: Pointer[UInt8, origin=_],
    position: Pointer[Int32, origin=_],
):
    external_call["TextAppend", NoneType](text, append, position)


def TextFindIndex(
    text: Pointer[UInt8, origin=_], search: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["TextFindIndex", Int32](text, search)


def TextToUpper(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextToUpper", Pointer[UInt8, origin=_]](text)


def TextToLower(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextToLower", Pointer[UInt8, origin=_]](text)


def TextToPascal(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextToPascal", Pointer[UInt8, origin=_]](text)


def TextToSnake(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextToSnake", Pointer[UInt8, origin=_]](text)


def TextToCamel(text: Pointer[UInt8, origin=_]) -> Pointer[UInt8, origin=_]:
    return external_call["TextToCamel", Pointer[UInt8, origin=_]](text)


def TextToInteger(text: Pointer[UInt8, origin=_]) -> Int32:
    return external_call["TextToInteger", Int32](text)


def TextToFloat(text: Pointer[UInt8, origin=_]) -> Float32:
    return external_call["TextToFloat", Float32](text)


def DrawLine3D(startPos: Vector3, endPos: Vector3, color: Color):
    external_call["DrawLine3D", NoneType](startPos, endPos, color)


def DrawPoint3D(position: Vector3, color: Color):
    external_call["DrawPoint3D", NoneType](position, color)


def DrawCircle3D(
    center: Vector3,
    radius: Float32,
    rotationAxis: Vector3,
    rotationAngle: Float32,
    color: Color,
):
    external_call["DrawCircle3D", NoneType](
        center, radius, rotationAxis, rotationAngle, color
    )


def DrawTriangle3D(v1: Vector3, v2: Vector3, v3: Vector3, color: Color):
    external_call["DrawTriangle3D", NoneType](v1, v2, v3, color)


def DrawTriangleStrip3D(
    points: Pointer[Vector3, origin=_], pointCount: Int32, color: Color
):
    external_call["DrawTriangleStrip3D", NoneType](points, pointCount, color)


def DrawCube(
    position: Vector3,
    width: Float32,
    height: Float32,
    length: Float32,
    color: Color,
):
    external_call["DrawCube", NoneType](position, width, height, length, color)


def DrawCubeV(position: Vector3, size: Vector3, color: Color):
    external_call["DrawCubeV", NoneType](position, size, color)


def DrawCubeWires(
    position: Vector3,
    width: Float32,
    height: Float32,
    length: Float32,
    color: Color,
):
    external_call["DrawCubeWires", NoneType](
        position, width, height, length, color
    )


def DrawCubeWiresV(position: Vector3, size: Vector3, color: Color):
    external_call["DrawCubeWiresV", NoneType](position, size, color)


def DrawSphere(centerPos: Vector3, radius: Float32, color: Color):
    external_call["DrawSphere", NoneType](centerPos, radius, color)


def DrawSphereEx(
    centerPos: Vector3,
    radius: Float32,
    rings: Int32,
    slices: Int32,
    color: Color,
):
    external_call["DrawSphereEx", NoneType](
        centerPos, radius, rings, slices, color
    )


def DrawSphereWires(
    centerPos: Vector3,
    radius: Float32,
    rings: Int32,
    slices: Int32,
    color: Color,
):
    external_call["DrawSphereWires", NoneType](
        centerPos, radius, rings, slices, color
    )


def DrawCylinder(
    position: Vector3,
    radiusTop: Float32,
    radiusBottom: Float32,
    height: Float32,
    sides: Int32,
    color: Color,
):
    external_call["DrawCylinder", NoneType](
        position, radiusTop, radiusBottom, height, sides, color
    )


def DrawCylinderEx(
    startPos: Vector3,
    endPos: Vector3,
    startRadius: Float32,
    endRadius: Float32,
    sides: Int32,
    color: Color,
):
    external_call["DrawCylinderEx", NoneType](
        startPos, endPos, startRadius, endRadius, sides, color
    )


def DrawCylinderWires(
    position: Vector3,
    radiusTop: Float32,
    radiusBottom: Float32,
    height: Float32,
    sides: Int32,
    color: Color,
):
    external_call["DrawCylinderWires", NoneType](
        position, radiusTop, radiusBottom, height, sides, color
    )


def DrawCylinderWiresEx(
    startPos: Vector3,
    endPos: Vector3,
    startRadius: Float32,
    endRadius: Float32,
    sides: Int32,
    color: Color,
):
    external_call["DrawCylinderWiresEx", NoneType](
        startPos, endPos, startRadius, endRadius, sides, color
    )


def DrawCapsule(
    startPos: Vector3,
    endPos: Vector3,
    radius: Float32,
    rings: Int32,
    slices: Int32,
    color: Color,
):
    external_call["DrawCapsule", NoneType](
        startPos, endPos, radius, rings, slices, color
    )


def DrawCapsuleWires(
    startPos: Vector3,
    endPos: Vector3,
    radius: Float32,
    rings: Int32,
    slices: Int32,
    color: Color,
):
    external_call["DrawCapsuleWires", NoneType](
        startPos, endPos, radius, rings, slices, color
    )


def DrawPlane(centerPos: Vector3, size: Vector2, color: Color):
    external_call["DrawPlane", NoneType](centerPos, size, color)


def DrawRay(ray: Ray, color: Color):
    external_call["DrawRay", NoneType](ray, color)


def DrawGrid(slices: Int32, spacing: Float32):
    external_call["DrawGrid", NoneType](slices, spacing)


def LoadModel(fileName: Pointer[UInt8, origin=_]) -> Model:
    return external_call["LoadModel", Model](fileName)


def LoadModelFromMesh(mesh: Mesh) -> Model:
    return external_call["LoadModelFromMesh", Model](mesh)


def IsModelValid(model: Model) -> Bool:
    return external_call["IsModelValid", Bool](model)


def UnloadModel(model: Model):
    external_call["UnloadModel", NoneType](model)


def GetModelBoundingBox(model: Model) -> BoundingBox:
    return external_call["GetModelBoundingBox", BoundingBox](model)


def DrawModel(model: Model, position: Vector3, scale: Float32, tint: Color):
    external_call["DrawModel", NoneType](model, position, scale, tint)


def DrawModelEx(
    model: Model,
    position: Vector3,
    rotationAxis: Vector3,
    rotationAngle: Float32,
    scale: Vector3,
    tint: Color,
):
    external_call["DrawModelEx", NoneType](
        model, position, rotationAxis, rotationAngle, scale, tint
    )


def DrawModelWires(
    model: Model, position: Vector3, scale: Float32, tint: Color
):
    external_call["DrawModelWires", NoneType](model, position, scale, tint)


def DrawModelWiresEx(
    model: Model,
    position: Vector3,
    rotationAxis: Vector3,
    rotationAngle: Float32,
    scale: Vector3,
    tint: Color,
):
    external_call["DrawModelWiresEx", NoneType](
        model, position, rotationAxis, rotationAngle, scale, tint
    )


def DrawBoundingBox(box: BoundingBox, color: Color):
    external_call["DrawBoundingBox", NoneType](box, color)


def DrawBillboard(
    camera: Camera3D,
    texture: Texture,
    position: Vector3,
    scale: Float32,
    tint: Color,
):
    external_call["DrawBillboard", NoneType](
        camera, texture, position, scale, tint
    )


def DrawBillboardRec(
    camera: Camera3D,
    texture: Texture,
    rec: Rectangle,
    position: Vector3,
    size: Vector2,
    tint: Color,
):
    external_call["DrawBillboardRec", NoneType](
        camera, texture, rec, position, size, tint
    )


def DrawBillboardPro(
    camera: Camera3D,
    texture: Texture,
    rec: Rectangle,
    position: Vector3,
    up: Vector3,
    size: Vector2,
    origin: Vector2,
    rotation: Float32,
    tint: Color,
):
    external_call["DrawBillboardPro", NoneType](
        camera, texture, rec, position, up, size, origin, rotation, tint
    )


def UploadMesh(mesh: Pointer[Mesh, origin=_], dynamic: Bool):
    external_call["UploadMesh", NoneType](mesh, dynamic)


def UpdateMeshBuffer(
    mesh: Mesh,
    index: Int32,
    data: Pointer[NoneType, origin=_],
    dataSize: Int32,
    offset: Int32,
):
    external_call["UpdateMeshBuffer", NoneType](
        mesh, index, data, dataSize, offset
    )


def UnloadMesh(mesh: Mesh):
    external_call["UnloadMesh", NoneType](mesh)


def DrawMesh(mesh: Mesh, material: Material, transform: Matrix):
    external_call["DrawMesh", NoneType](mesh, material, transform)


def DrawMeshInstanced(
    mesh: Mesh,
    material: Material,
    transforms: Pointer[Matrix, origin=_],
    instances: Int32,
):
    external_call["DrawMeshInstanced", NoneType](
        mesh, material, transforms, instances
    )


def GetMeshBoundingBox(mesh: Mesh) -> BoundingBox:
    return external_call["GetMeshBoundingBox", BoundingBox](mesh)


def GenMeshTangents(mesh: Pointer[Mesh, origin=_]):
    external_call["GenMeshTangents", NoneType](mesh)


def ExportMesh(mesh: Mesh, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportMesh", Bool](mesh, fileName)


def ExportMeshAsCode(mesh: Mesh, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportMeshAsCode", Bool](mesh, fileName)


def GenMeshPoly(sides: Int32, radius: Float32) -> Mesh:
    return external_call["GenMeshPoly", Mesh](sides, radius)


def GenMeshPlane(
    width: Float32, length: Float32, resX: Int32, resZ: Int32
) -> Mesh:
    return external_call["GenMeshPlane", Mesh](width, length, resX, resZ)


def GenMeshCube(width: Float32, height: Float32, length: Float32) -> Mesh:
    return external_call["GenMeshCube", Mesh](width, height, length)


def GenMeshSphere(radius: Float32, rings: Int32, slices: Int32) -> Mesh:
    return external_call["GenMeshSphere", Mesh](radius, rings, slices)


def GenMeshHemiSphere(radius: Float32, rings: Int32, slices: Int32) -> Mesh:
    return external_call["GenMeshHemiSphere", Mesh](radius, rings, slices)


def GenMeshCylinder(radius: Float32, height: Float32, slices: Int32) -> Mesh:
    return external_call["GenMeshCylinder", Mesh](radius, height, slices)


def GenMeshCone(radius: Float32, height: Float32, slices: Int32) -> Mesh:
    return external_call["GenMeshCone", Mesh](radius, height, slices)


def GenMeshTorus(
    radius: Float32, size: Float32, radSeg: Int32, sides: Int32
) -> Mesh:
    return external_call["GenMeshTorus", Mesh](radius, size, radSeg, sides)


def GenMeshKnot(
    radius: Float32, size: Float32, radSeg: Int32, sides: Int32
) -> Mesh:
    return external_call["GenMeshKnot", Mesh](radius, size, radSeg, sides)


def GenMeshHeightmap(heightmap: Image, size: Vector3) -> Mesh:
    return external_call["GenMeshHeightmap", Mesh](heightmap, size)


def GenMeshCubicmap(cubicmap: Image, cubeSize: Vector3) -> Mesh:
    return external_call["GenMeshCubicmap", Mesh](cubicmap, cubeSize)


def LoadMaterials(
    fileName: Pointer[UInt8, origin=_], materialCount: Pointer[Int32, origin=_]
) -> Pointer[Material, origin=_]:
    return external_call["LoadMaterials", Pointer[Material, origin=_]](
        fileName, materialCount
    )


def LoadMaterialDefault() -> Material:
    return external_call["LoadMaterialDefault", Material]()


def IsMaterialValid(material: Material) -> Bool:
    return external_call["IsMaterialValid", Bool](material)


def UnloadMaterial(material: Material):
    external_call["UnloadMaterial", NoneType](material)


def SetMaterialTexture(
    material: Pointer[Material, origin=_], mapType: Int32, texture: Texture
):
    external_call["SetMaterialTexture", NoneType](material, mapType, texture)


def SetModelMeshMaterial(
    model: Pointer[Model, origin=_], meshId: Int32, materialId: Int32
):
    external_call["SetModelMeshMaterial", NoneType](model, meshId, materialId)


def LoadModelAnimations(
    fileName: Pointer[UInt8, origin=_], animCount: Pointer[Int32, origin=_]
) -> Pointer[ModelAnimation, origin=_]:
    return external_call[
        "LoadModelAnimations", Pointer[ModelAnimation, origin=_]
    ](fileName, animCount)


def UpdateModelAnimation(model: Model, anim: ModelAnimation, frame: Float32):
    external_call["UpdateModelAnimation", NoneType](model, anim, frame)


def UpdateModelAnimationEx(
    model: Model,
    animA: ModelAnimation,
    frameA: Float32,
    animB: ModelAnimation,
    frameB: Float32,
    blend: Float32,
):
    external_call["UpdateModelAnimationEx", NoneType](
        model, animA, frameA, animB, frameB, blend
    )


def UnloadModelAnimations(
    animations: Pointer[ModelAnimation, origin=_], animCount: Int32
):
    external_call["UnloadModelAnimations", NoneType](animations, animCount)


def IsModelAnimationValid(model: Model, anim: ModelAnimation) -> Bool:
    return external_call["IsModelAnimationValid", Bool](model, anim)


def CheckCollisionSpheres(
    center1: Vector3, radius1: Float32, center2: Vector3, radius2: Float32
) -> Bool:
    return external_call["CheckCollisionSpheres", Bool](
        center1, radius1, center2, radius2
    )


def CheckCollisionBoxes(box1: BoundingBox, box2: BoundingBox) -> Bool:
    return external_call["CheckCollisionBoxes", Bool](box1, box2)


def CheckCollisionBoxSphere(
    box: BoundingBox, center: Vector3, radius: Float32
) -> Bool:
    return external_call["CheckCollisionBoxSphere", Bool](box, center, radius)


def GetRayCollisionSphere(
    ray: Ray, center: Vector3, radius: Float32
) -> RayCollision:
    return external_call["GetRayCollisionSphere", RayCollision](
        ray, center, radius
    )


def GetRayCollisionBox(ray: Ray, box: BoundingBox) -> RayCollision:
    return external_call["GetRayCollisionBox", RayCollision](ray, box)


def GetRayCollisionMesh(
    ray: Ray, mesh: Mesh, transform: Matrix
) -> RayCollision:
    return external_call["GetRayCollisionMesh", RayCollision](
        ray, mesh, transform
    )


def GetRayCollisionTriangle(
    ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3
) -> RayCollision:
    return external_call["GetRayCollisionTriangle", RayCollision](
        ray, p1, p2, p3
    )


def GetRayCollisionQuad(
    ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3, p4: Vector3
) -> RayCollision:
    return external_call["GetRayCollisionQuad", RayCollision](
        ray, p1, p2, p3, p4
    )


def InitAudioDevice():
    external_call["InitAudioDevice", NoneType]()


def CloseAudioDevice():
    external_call["CloseAudioDevice", NoneType]()


def IsAudioDeviceReady() -> Bool:
    return external_call["IsAudioDeviceReady", Bool]()


def SetMasterVolume(volume: Float32):
    external_call["SetMasterVolume", NoneType](volume)


def GetMasterVolume() -> Float32:
    return external_call["GetMasterVolume", Float32]()


def LoadWave(fileName: Pointer[UInt8, origin=_]) -> Wave:
    return external_call["LoadWave", Wave](fileName)


def LoadWaveFromMemory(
    fileType: Pointer[UInt8, origin=_],
    fileData: Pointer[UInt8, origin=_],
    dataSize: Int32,
) -> Wave:
    return external_call["LoadWaveFromMemory", Wave](
        fileType, fileData, dataSize
    )


def IsWaveValid(wave: Wave) -> Bool:
    return external_call["IsWaveValid", Bool](wave)


def LoadSound(fileName: Pointer[UInt8, origin=_]) -> Sound:
    return external_call["LoadSound", Sound](fileName)


def LoadSoundFromWave(wave: Wave) -> Sound:
    return external_call["LoadSoundFromWave", Sound](wave)


def LoadSoundAlias(source: Sound) -> Sound:
    return external_call["LoadSoundAlias", Sound](source)


def IsSoundValid(sound: Sound) -> Bool:
    return external_call["IsSoundValid", Bool](sound)


def UpdateSound(
    sound: Sound, data: Pointer[NoneType, origin=_], frameCount: Int32
):
    external_call["UpdateSound", NoneType](sound, data, frameCount)


def UnloadWave(wave: Wave):
    external_call["UnloadWave", NoneType](wave)


def UnloadSound(sound: Sound):
    external_call["UnloadSound", NoneType](sound)


def UnloadSoundAlias(alias_: Sound):
    external_call["UnloadSoundAlias", NoneType](alias_)


def ExportWave(wave: Wave, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportWave", Bool](wave, fileName)


def ExportWaveAsCode(wave: Wave, fileName: Pointer[UInt8, origin=_]) -> Bool:
    return external_call["ExportWaveAsCode", Bool](wave, fileName)


def PlaySound(sound: Sound):
    external_call["PlaySound", NoneType](sound)


def StopSound(sound: Sound):
    external_call["StopSound", NoneType](sound)


def PauseSound(sound: Sound):
    external_call["PauseSound", NoneType](sound)


def ResumeSound(sound: Sound):
    external_call["ResumeSound", NoneType](sound)


def IsSoundPlaying(sound: Sound) -> Bool:
    return external_call["IsSoundPlaying", Bool](sound)


def SetSoundVolume(sound: Sound, volume: Float32):
    external_call["SetSoundVolume", NoneType](sound, volume)


def SetSoundPitch(sound: Sound, pitch: Float32):
    external_call["SetSoundPitch", NoneType](sound, pitch)


def SetSoundPan(sound: Sound, pan: Float32):
    external_call["SetSoundPan", NoneType](sound, pan)


def WaveCopy(wave: Wave) -> Wave:
    return external_call["WaveCopy", Wave](wave)


def WaveCrop(
    wave: Pointer[Wave, origin=_], initFrame: Int32, finalFrame: Int32
):
    external_call["WaveCrop", NoneType](wave, initFrame, finalFrame)


def WaveFormat(
    wave: Pointer[Wave, origin=_],
    sampleRate: Int32,
    sampleSize: Int32,
    channels: Int32,
):
    external_call["WaveFormat", NoneType](
        wave, sampleRate, sampleSize, channels
    )


def LoadWaveSamples(wave: Wave) -> Pointer[Float32, origin=_]:
    return external_call["LoadWaveSamples", Pointer[Float32, origin=_]](wave)


def UnloadWaveSamples(samples: Pointer[Float32, origin=_]):
    external_call["UnloadWaveSamples", NoneType](samples)


def LoadMusicStream(fileName: Pointer[UInt8, origin=_]) -> Music:
    return external_call["LoadMusicStream", Music](fileName)


def LoadMusicStreamFromMemory(
    fileType: Pointer[UInt8, origin=_],
    data: Pointer[UInt8, origin=_],
    dataSize: Int32,
) -> Music:
    return external_call["LoadMusicStreamFromMemory", Music](
        fileType, data, dataSize
    )


def IsMusicValid(music: Music) -> Bool:
    return external_call["IsMusicValid", Bool](music)


def UnloadMusicStream(music: Music):
    external_call["UnloadMusicStream", NoneType](music)


def PlayMusicStream(music: Music):
    external_call["PlayMusicStream", NoneType](music)


def IsMusicStreamPlaying(music: Music) -> Bool:
    return external_call["IsMusicStreamPlaying", Bool](music)


def UpdateMusicStream(music: Music):
    external_call["UpdateMusicStream", NoneType](music)


def StopMusicStream(music: Music):
    external_call["StopMusicStream", NoneType](music)


def PauseMusicStream(music: Music):
    external_call["PauseMusicStream", NoneType](music)


def ResumeMusicStream(music: Music):
    external_call["ResumeMusicStream", NoneType](music)


def SeekMusicStream(music: Music, position: Float32):
    external_call["SeekMusicStream", NoneType](music, position)


def SetMusicVolume(music: Music, volume: Float32):
    external_call["SetMusicVolume", NoneType](music, volume)


def SetMusicPitch(music: Music, pitch: Float32):
    external_call["SetMusicPitch", NoneType](music, pitch)


def SetMusicPan(music: Music, pan: Float32):
    external_call["SetMusicPan", NoneType](music, pan)


def GetMusicTimeLength(music: Music) -> Float32:
    return external_call["GetMusicTimeLength", Float32](music)


def GetMusicTimePlayed(music: Music) -> Float32:
    return external_call["GetMusicTimePlayed", Float32](music)


def LoadAudioStream(
    sampleRate: UInt32, sampleSize: UInt32, channels: UInt32
) -> AudioStream:
    return external_call["LoadAudioStream", AudioStream](
        sampleRate, sampleSize, channels
    )


def IsAudioStreamValid(stream: AudioStream) -> Bool:
    return external_call["IsAudioStreamValid", Bool](stream)


def UnloadAudioStream(stream: AudioStream):
    external_call["UnloadAudioStream", NoneType](stream)


def UpdateAudioStream(
    stream: AudioStream, data: Pointer[NoneType, origin=_], frameCount: Int32
):
    external_call["UpdateAudioStream", NoneType](stream, data, frameCount)


def IsAudioStreamProcessed(stream: AudioStream) -> Bool:
    return external_call["IsAudioStreamProcessed", Bool](stream)


def PlayAudioStream(stream: AudioStream):
    external_call["PlayAudioStream", NoneType](stream)


def PauseAudioStream(stream: AudioStream):
    external_call["PauseAudioStream", NoneType](stream)


def ResumeAudioStream(stream: AudioStream):
    external_call["ResumeAudioStream", NoneType](stream)


def IsAudioStreamPlaying(stream: AudioStream) -> Bool:
    return external_call["IsAudioStreamPlaying", Bool](stream)


def StopAudioStream(stream: AudioStream):
    external_call["StopAudioStream", NoneType](stream)


def SetAudioStreamVolume(stream: AudioStream, volume: Float32):
    external_call["SetAudioStreamVolume", NoneType](stream, volume)


def SetAudioStreamPitch(stream: AudioStream, pitch: Float32):
    external_call["SetAudioStreamPitch", NoneType](stream, pitch)


def SetAudioStreamPan(stream: AudioStream, pan: Float32):
    external_call["SetAudioStreamPan", NoneType](stream, pan)


def SetAudioStreamBufferSizeDefault(size: Int32):
    external_call["SetAudioStreamBufferSizeDefault", NoneType](size)


def SetAudioStreamCallback(
    stream: AudioStream, callback: Pointer[NoneType, origin=_]
):
    external_call["SetAudioStreamCallback", NoneType](stream, callback)


def AttachAudioStreamProcessor(
    stream: AudioStream, processor: Pointer[NoneType, origin=_]
):
    external_call["AttachAudioStreamProcessor", NoneType](stream, processor)


def DetachAudioStreamProcessor(
    stream: AudioStream, processor: Pointer[NoneType, origin=_]
):
    external_call["DetachAudioStreamProcessor", NoneType](stream, processor)


def AttachAudioMixedProcessor(processor: Pointer[NoneType, origin=_]):
    external_call["AttachAudioMixedProcessor", NoneType](processor)


def DetachAudioMixedProcessor(processor: Pointer[NoneType, origin=_]):
    external_call["DetachAudioMixedProcessor", NoneType](processor)

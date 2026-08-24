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


def rlMatrixMode(mode: Int32):
    external_call["rlMatrixMode", NoneType](mode)


def rlPushMatrix():
    external_call["rlPushMatrix", NoneType]()


def rlPopMatrix():
    external_call["rlPopMatrix", NoneType]()


def rlLoadIdentity():
    external_call["rlLoadIdentity", NoneType]()


def rlTranslatef(x: Float32, y: Float32, z: Float32):
    external_call["rlTranslatef", NoneType](x, y, z)


def rlRotatef(angle: Float32, x: Float32, y: Float32, z: Float32):
    external_call["rlRotatef", NoneType](angle, x, y, z)


def rlScalef(x: Float32, y: Float32, z: Float32):
    external_call["rlScalef", NoneType](x, y, z)


def rlMultMatrixf(matf: Pointer[Float32, origin=_]):
    external_call["rlMultMatrixf", NoneType](matf)


def rlFrustum(
    left: Float64,
    right: Float64,
    bottom: Float64,
    top: Float64,
    znear: Float64,
    zfar: Float64,
):
    external_call["rlFrustum", NoneType](left, right, bottom, top, znear, zfar)


def rlOrtho(
    left: Float64,
    right: Float64,
    bottom: Float64,
    top: Float64,
    znear: Float64,
    zfar: Float64,
):
    external_call["rlOrtho", NoneType](left, right, bottom, top, znear, zfar)


def rlViewport(x: Int32, y: Int32, width: Int32, height: Int32):
    external_call["rlViewport", NoneType](x, y, width, height)


def rlSetClipPlanes(nearPlane: Float64, farPlane: Float64):
    external_call["rlSetClipPlanes", NoneType](nearPlane, farPlane)


def rlGetCullDistanceNear() -> Float64:
    return external_call["rlGetCullDistanceNear", Float64]()


def rlGetCullDistanceFar() -> Float64:
    return external_call["rlGetCullDistanceFar", Float64]()


def rlBegin(mode: Int32):
    external_call["rlBegin", NoneType](mode)


def rlEnd():
    external_call["rlEnd", NoneType]()


def rlVertex2i(x: Int32, y: Int32):
    external_call["rlVertex2i", NoneType](x, y)


def rlVertex2f(x: Float32, y: Float32):
    external_call["rlVertex2f", NoneType](x, y)


def rlVertex3f(x: Float32, y: Float32, z: Float32):
    external_call["rlVertex3f", NoneType](x, y, z)


def rlTexCoord2f(x: Float32, y: Float32):
    external_call["rlTexCoord2f", NoneType](x, y)


def rlNormal3f(x: Float32, y: Float32, z: Float32):
    external_call["rlNormal3f", NoneType](x, y, z)


def rlColor4ub(r: UInt8, g: UInt8, b: UInt8, a: UInt8):
    external_call["rlColor4ub", NoneType](r, g, b, a)


def rlColor3f(x: Float32, y: Float32, z: Float32):
    external_call["rlColor3f", NoneType](x, y, z)


def rlColor4f(x: Float32, y: Float32, z: Float32, w: Float32):
    external_call["rlColor4f", NoneType](x, y, z, w)


def rlEnableVertexArray(vaoId: UInt32) -> Bool:
    return external_call["rlEnableVertexArray", Bool](vaoId)


def rlDisableVertexArray():
    external_call["rlDisableVertexArray", NoneType]()


def rlEnableVertexBuffer(id: UInt32):
    external_call["rlEnableVertexBuffer", NoneType](id)


def rlDisableVertexBuffer():
    external_call["rlDisableVertexBuffer", NoneType]()


def rlEnableVertexBufferElement(id: UInt32):
    external_call["rlEnableVertexBufferElement", NoneType](id)


def rlDisableVertexBufferElement():
    external_call["rlDisableVertexBufferElement", NoneType]()


def rlEnableVertexAttribute(index: UInt32):
    external_call["rlEnableVertexAttribute", NoneType](index)


def rlDisableVertexAttribute(index: UInt32):
    external_call["rlDisableVertexAttribute", NoneType](index)


def rlEnableStatePointer(
    vertexAttribType: Int32, buffer: Pointer[NoneType, origin=_]
):
    external_call["rlEnableStatePointer", NoneType](vertexAttribType, buffer)


def rlDisableStatePointer(vertexAttribType: Int32):
    external_call["rlDisableStatePointer", NoneType](vertexAttribType)


def rlActiveTextureSlot(slot: Int32):
    external_call["rlActiveTextureSlot", NoneType](slot)


def rlEnableTexture(id: UInt32):
    external_call["rlEnableTexture", NoneType](id)


def rlDisableTexture():
    external_call["rlDisableTexture", NoneType]()


def rlEnableTextureCubemap(id: UInt32):
    external_call["rlEnableTextureCubemap", NoneType](id)


def rlDisableTextureCubemap():
    external_call["rlDisableTextureCubemap", NoneType]()


def rlTextureParameters(id: UInt32, param: Int32, value: Int32):
    external_call["rlTextureParameters", NoneType](id, param, value)


def rlCubemapParameters(id: UInt32, param: Int32, value: Int32):
    external_call["rlCubemapParameters", NoneType](id, param, value)


def rlEnableShader(id: UInt32):
    external_call["rlEnableShader", NoneType](id)


def rlDisableShader():
    external_call["rlDisableShader", NoneType]()


def rlEnableFramebuffer(id: UInt32):
    external_call["rlEnableFramebuffer", NoneType](id)


def rlDisableFramebuffer():
    external_call["rlDisableFramebuffer", NoneType]()


def rlGetActiveFramebuffer() -> UInt32:
    return external_call["rlGetActiveFramebuffer", UInt32]()


def rlActiveDrawBuffers(count: Int32):
    external_call["rlActiveDrawBuffers", NoneType](count)


def rlBlitFramebuffer(
    srcX: Int32,
    srcY: Int32,
    srcWidth: Int32,
    srcHeight: Int32,
    dstX: Int32,
    dstY: Int32,
    dstWidth: Int32,
    dstHeight: Int32,
    bufferMask: Int32,
):
    external_call["rlBlitFramebuffer", NoneType](
        srcX,
        srcY,
        srcWidth,
        srcHeight,
        dstX,
        dstY,
        dstWidth,
        dstHeight,
        bufferMask,
    )


def rlBindFramebuffer(target: UInt32, framebuffer: UInt32):
    external_call["rlBindFramebuffer", NoneType](target, framebuffer)


def rlEnableColorBlend():
    external_call["rlEnableColorBlend", NoneType]()


def rlDisableColorBlend():
    external_call["rlDisableColorBlend", NoneType]()


def rlEnableDepthTest():
    external_call["rlEnableDepthTest", NoneType]()


def rlDisableDepthTest():
    external_call["rlDisableDepthTest", NoneType]()


def rlEnableDepthMask():
    external_call["rlEnableDepthMask", NoneType]()


def rlDisableDepthMask():
    external_call["rlDisableDepthMask", NoneType]()


def rlEnableBackfaceCulling():
    external_call["rlEnableBackfaceCulling", NoneType]()


def rlDisableBackfaceCulling():
    external_call["rlDisableBackfaceCulling", NoneType]()


def rlColorMask(r: Bool, g: Bool, b: Bool, a: Bool):
    external_call["rlColorMask", NoneType](r, g, b, a)


def rlSetCullFace(mode: Int32):
    external_call["rlSetCullFace", NoneType](mode)


def rlEnableScissorTest():
    external_call["rlEnableScissorTest", NoneType]()


def rlDisableScissorTest():
    external_call["rlDisableScissorTest", NoneType]()


def rlScissor(x: Int32, y: Int32, width: Int32, height: Int32):
    external_call["rlScissor", NoneType](x, y, width, height)


def rlEnablePointMode():
    external_call["rlEnablePointMode", NoneType]()


def rlDisablePointMode():
    external_call["rlDisablePointMode", NoneType]()


def rlSetPointSize(size: Float32):
    external_call["rlSetPointSize", NoneType](size)


def rlGetPointSize() -> Float32:
    return external_call["rlGetPointSize", Float32]()


def rlEnableWireMode():
    external_call["rlEnableWireMode", NoneType]()


def rlDisableWireMode():
    external_call["rlDisableWireMode", NoneType]()


def rlSetLineWidth(width: Float32):
    external_call["rlSetLineWidth", NoneType](width)


def rlGetLineWidth() -> Float32:
    return external_call["rlGetLineWidth", Float32]()


def rlEnableSmoothLines():
    external_call["rlEnableSmoothLines", NoneType]()


def rlDisableSmoothLines():
    external_call["rlDisableSmoothLines", NoneType]()


def rlEnableStereoRender():
    external_call["rlEnableStereoRender", NoneType]()


def rlDisableStereoRender():
    external_call["rlDisableStereoRender", NoneType]()


def rlIsStereoRenderEnabled() -> Bool:
    return external_call["rlIsStereoRenderEnabled", Bool]()


def rlClearColor(r: UInt8, g: UInt8, b: UInt8, a: UInt8):
    external_call["rlClearColor", NoneType](r, g, b, a)


def rlClearScreenBuffers():
    external_call["rlClearScreenBuffers", NoneType]()


def rlCheckErrors():
    external_call["rlCheckErrors", NoneType]()


def rlSetBlendMode(mode: Int32):
    external_call["rlSetBlendMode", NoneType](mode)


def rlSetBlendFactors(
    glSrcFactor: Int32, glDstFactor: Int32, glEquation: Int32
):
    external_call["rlSetBlendFactors", NoneType](
        glSrcFactor, glDstFactor, glEquation
    )


def rlSetBlendFactorsSeparate(
    glSrcRGB: Int32,
    glDstRGB: Int32,
    glSrcAlpha: Int32,
    glDstAlpha: Int32,
    glEqRGB: Int32,
    glEqAlpha: Int32,
):
    external_call["rlSetBlendFactorsSeparate", NoneType](
        glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha
    )


def rlglInit(width: Int32, height: Int32):
    external_call["rlglInit", NoneType](width, height)


def rlglClose():
    external_call["rlglClose", NoneType]()


def rlLoadExtensions(loader: Pointer[NoneType, origin=_]):
    external_call["rlLoadExtensions", NoneType](loader)


def rlGetProcAddress(
    procName: Pointer[UInt8, origin=_]
) -> Pointer[NoneType, origin=_]:
    return external_call["rlGetProcAddress", Pointer[NoneType, origin=_]](
        procName
    )


def rlGetVersion() -> Int32:
    return external_call["rlGetVersion", Int32]()


def rlSetFramebufferWidth(width: Int32):
    external_call["rlSetFramebufferWidth", NoneType](width)


def rlGetFramebufferWidth() -> Int32:
    return external_call["rlGetFramebufferWidth", Int32]()


def rlSetFramebufferHeight(height: Int32):
    external_call["rlSetFramebufferHeight", NoneType](height)


def rlGetFramebufferHeight() -> Int32:
    return external_call["rlGetFramebufferHeight", Int32]()


def rlGetTextureIdDefault() -> UInt32:
    return external_call["rlGetTextureIdDefault", UInt32]()


def rlGetShaderIdDefault() -> UInt32:
    return external_call["rlGetShaderIdDefault", UInt32]()


def rlGetShaderLocsDefault() -> Pointer[Int32, origin=_]:
    return external_call["rlGetShaderLocsDefault", Pointer[Int32, origin=_]]()


def rlLoadRenderBatch(
    numBuffers: Int32, bufferElements: Int32
) -> Pointer[NoneType, origin=_]:
    return external_call["rlLoadRenderBatch", Pointer[NoneType, origin=_]](
        numBuffers, bufferElements
    )


def rlUnloadRenderBatch(batch: Pointer[NoneType, origin=_]):
    external_call["rlUnloadRenderBatch", NoneType](batch)


def rlDrawRenderBatch(batch: Pointer[Pointer[NoneType, origin=_], origin=_]):
    external_call["rlDrawRenderBatch", NoneType](batch)


def rlSetRenderBatchActive(
    batch: Pointer[Pointer[NoneType, origin=_], origin=_]
):
    external_call["rlSetRenderBatchActive", NoneType](batch)


def rlDrawRenderBatchActive():
    external_call["rlDrawRenderBatchActive", NoneType]()


def rlCheckRenderBatchLimit(vCount: Int32) -> Bool:
    return external_call["rlCheckRenderBatchLimit", Bool](vCount)


def rlSetTexture(id: UInt32):
    external_call["rlSetTexture", NoneType](id)


def rlLoadVertexArray() -> UInt32:
    return external_call["rlLoadVertexArray", UInt32]()


def rlLoadVertexBuffer(
    buffer: Pointer[NoneType, origin=_], size: Int32, dynamic: Bool
) -> UInt32:
    return external_call["rlLoadVertexBuffer", UInt32](buffer, size, dynamic)


def rlLoadVertexBufferElement(
    buffer: Pointer[NoneType, origin=_], size: Int32, dynamic: Bool
) -> UInt32:
    return external_call["rlLoadVertexBufferElement", UInt32](
        buffer, size, dynamic
    )


def rlUpdateVertexBuffer(
    bufferId: UInt32,
    data: Pointer[NoneType, origin=_],
    dataSize: Int32,
    offset: Int32,
):
    external_call["rlUpdateVertexBuffer", NoneType](
        bufferId, data, dataSize, offset
    )


def rlUpdateVertexBufferElements(
    id: UInt32,
    data: Pointer[NoneType, origin=_],
    dataSize: Int32,
    offset: Int32,
):
    external_call["rlUpdateVertexBufferElements", NoneType](
        id, data, dataSize, offset
    )


def rlUnloadVertexArray(vaoId: UInt32):
    external_call["rlUnloadVertexArray", NoneType](vaoId)


def rlUnloadVertexBuffer(vboId: UInt32):
    external_call["rlUnloadVertexBuffer", NoneType](vboId)


def rlSetVertexAttribute(
    index: UInt32,
    compSize: Int32,
    type_: Int32,
    normalized: Bool,
    stride: Int32,
    offset: Int32,
):
    external_call["rlSetVertexAttribute", NoneType](
        index, compSize, type_, normalized, stride, offset
    )


def rlSetVertexAttributeDivisor(index: UInt32, divisor: Int32):
    external_call["rlSetVertexAttributeDivisor", NoneType](index, divisor)


def rlSetVertexAttributeDefault(
    locIndex: Int32,
    value: Pointer[NoneType, origin=_],
    attribType: Int32,
    count: Int32,
):
    external_call["rlSetVertexAttributeDefault", NoneType](
        locIndex, value, attribType, count
    )


def rlDrawVertexArray(offset: Int32, count: Int32):
    external_call["rlDrawVertexArray", NoneType](offset, count)


def rlDrawVertexArrayElements(
    offset: Int32, count: Int32, buffer: Pointer[NoneType, origin=_]
):
    external_call["rlDrawVertexArrayElements", NoneType](offset, count, buffer)


def rlDrawVertexArrayInstanced(offset: Int32, count: Int32, instances: Int32):
    external_call["rlDrawVertexArrayInstanced", NoneType](
        offset, count, instances
    )


def rlDrawVertexArrayElementsInstanced(
    offset: Int32,
    count: Int32,
    buffer: Pointer[NoneType, origin=_],
    instances: Int32,
):
    external_call["rlDrawVertexArrayElementsInstanced", NoneType](
        offset, count, buffer, instances
    )


def rlLoadTexture(
    data: Pointer[NoneType, origin=_],
    width: Int32,
    height: Int32,
    format: Int32,
    mipmapCount: Int32,
) -> UInt32:
    return external_call["rlLoadTexture", UInt32](
        data, width, height, format, mipmapCount
    )


def rlLoadTextureDepth(
    width: Int32, height: Int32, useRenderBuffer: Bool
) -> UInt32:
    return external_call["rlLoadTextureDepth", UInt32](
        width, height, useRenderBuffer
    )


def rlLoadTextureCubemap(
    data: Pointer[NoneType, origin=_],
    size: Int32,
    format: Int32,
    mipmapCount: Int32,
) -> UInt32:
    return external_call["rlLoadTextureCubemap", UInt32](
        data, size, format, mipmapCount
    )


def rlUpdateTexture(
    id: UInt32,
    offsetX: Int32,
    offsetY: Int32,
    width: Int32,
    height: Int32,
    format: Int32,
    data: Pointer[NoneType, origin=_],
):
    external_call["rlUpdateTexture", NoneType](
        id, offsetX, offsetY, width, height, format, data
    )


def rlGetGlTextureFormats(
    format: Int32,
    glInternalFormat: Pointer[UInt32, origin=_],
    glFormat: Pointer[UInt32, origin=_],
    glType: Pointer[UInt32, origin=_],
):
    external_call["rlGetGlTextureFormats", NoneType](
        format, glInternalFormat, glFormat, glType
    )


def rlGetPixelFormatName(format: UInt32) -> Pointer[UInt8, origin=_]:
    return external_call["rlGetPixelFormatName", Pointer[UInt8, origin=_]](
        format
    )


def rlUnloadTexture(id: UInt32):
    external_call["rlUnloadTexture", NoneType](id)


def rlGenTextureMipmaps(
    id: UInt32,
    width: Int32,
    height: Int32,
    format: Int32,
    mipmaps: Pointer[Int32, origin=_],
):
    external_call["rlGenTextureMipmaps", NoneType](
        id, width, height, format, mipmaps
    )


def rlReadTexturePixels(
    id: UInt32, width: Int32, height: Int32, format: Int32
) -> Pointer[NoneType, origin=_]:
    return external_call["rlReadTexturePixels", Pointer[NoneType, origin=_]](
        id, width, height, format
    )


def rlReadScreenPixels(width: Int32, height: Int32) -> Pointer[UInt8, origin=_]:
    return external_call["rlReadScreenPixels", Pointer[UInt8, origin=_]](
        width, height
    )


def rlLoadFramebuffer() -> UInt32:
    return external_call["rlLoadFramebuffer", UInt32]()


def rlFramebufferAttach(
    id: UInt32,
    texId: UInt32,
    attachType: Int32,
    texType: Int32,
    mipLevel: Int32,
):
    external_call["rlFramebufferAttach", NoneType](
        id, texId, attachType, texType, mipLevel
    )


def rlFramebufferComplete(id: UInt32) -> Bool:
    return external_call["rlFramebufferComplete", Bool](id)


def rlUnloadFramebuffer(id: UInt32):
    external_call["rlUnloadFramebuffer", NoneType](id)


def rlCopyFramebuffer(
    x: Int32,
    y: Int32,
    width: Int32,
    height: Int32,
    format: Int32,
    pixels: Pointer[NoneType, origin=_],
):
    external_call["rlCopyFramebuffer", NoneType](
        x, y, width, height, format, pixels
    )


def rlResizeFramebuffer(width: Int32, height: Int32):
    external_call["rlResizeFramebuffer", NoneType](width, height)


def rlLoadShader(code: Pointer[UInt8, origin=_], type_: Int32) -> UInt32:
    return external_call["rlLoadShader", UInt32](code, type_)


def rlLoadShaderProgram(
    vsCode: Pointer[UInt8, origin=_], fsCode: Pointer[UInt8, origin=_]
) -> UInt32:
    return external_call["rlLoadShaderProgram", UInt32](vsCode, fsCode)


def rlLoadShaderProgramEx(vsId: UInt32, fsId: UInt32) -> UInt32:
    return external_call["rlLoadShaderProgramEx", UInt32](vsId, fsId)


def rlLoadShaderProgramCompute(csId: UInt32) -> UInt32:
    return external_call["rlLoadShaderProgramCompute", UInt32](csId)


def rlUnloadShader(id: UInt32):
    external_call["rlUnloadShader", NoneType](id)


def rlUnloadShaderProgram(id: UInt32):
    external_call["rlUnloadShaderProgram", NoneType](id)


def rlGetLocationUniform(
    id: UInt32, uniformName: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["rlGetLocationUniform", Int32](id, uniformName)


def rlGetLocationAttrib(
    id: UInt32, attribName: Pointer[UInt8, origin=_]
) -> Int32:
    return external_call["rlGetLocationAttrib", Int32](id, attribName)


def rlSetUniform(
    locIndex: Int32,
    value: Pointer[NoneType, origin=_],
    uniformType: Int32,
    count: Int32,
):
    external_call["rlSetUniform", NoneType](locIndex, value, uniformType, count)


def rlSetUniformMatrix(locIndex: Int32, mat: Matrix):
    external_call["rlSetUniformMatrix", NoneType](locIndex, mat)


def rlSetUniformMatrices(
    locIndex: Int32, mat: Pointer[Matrix, origin=_], count: Int32
):
    external_call["rlSetUniformMatrices", NoneType](locIndex, mat, count)


def rlSetUniformSampler(locIndex: Int32, textureId: UInt32):
    external_call["rlSetUniformSampler", NoneType](locIndex, textureId)


def rlSetShader(id: UInt32, locs: Pointer[Int32, origin=_]):
    external_call["rlSetShader", NoneType](id, locs)


def rlComputeShaderDispatch(groupX: UInt32, groupY: UInt32, groupZ: UInt32):
    external_call["rlComputeShaderDispatch", NoneType](groupX, groupY, groupZ)


def rlLoadShaderBuffer(
    size: UInt32, data: Pointer[NoneType, origin=_], usageHint: Int32
) -> UInt32:
    return external_call["rlLoadShaderBuffer", UInt32](size, data, usageHint)


def rlUnloadShaderBuffer(ssboId: UInt32):
    external_call["rlUnloadShaderBuffer", NoneType](ssboId)


def rlUpdateShaderBuffer(
    id: UInt32,
    data: Pointer[NoneType, origin=_],
    dataSize: UInt32,
    offset: UInt32,
):
    external_call["rlUpdateShaderBuffer", NoneType](id, data, dataSize, offset)


def rlBindShaderBuffer(id: UInt32, index: UInt32):
    external_call["rlBindShaderBuffer", NoneType](id, index)


def rlReadShaderBuffer(
    id: UInt32, dest: Pointer[NoneType, origin=_], count: UInt32, offset: UInt32
):
    external_call["rlReadShaderBuffer", NoneType](id, dest, count, offset)


def rlCopyShaderBuffer(
    destId: UInt32,
    srcId: UInt32,
    destOffset: UInt32,
    srcOffset: UInt32,
    count: UInt32,
):
    external_call["rlCopyShaderBuffer", NoneType](
        destId, srcId, destOffset, srcOffset, count
    )


def rlGetShaderBufferSize(id: UInt32) -> UInt32:
    return external_call["rlGetShaderBufferSize", UInt32](id)


def rlBindImageTexture(
    id: UInt32, index: UInt32, format: Int32, readonly: Bool
):
    external_call["rlBindImageTexture", NoneType](id, index, format, readonly)


def rlGetMatrixModelview() -> Matrix:
    return external_call["rlGetMatrixModelview", Matrix]()


def rlGetMatrixProjection() -> Matrix:
    return external_call["rlGetMatrixProjection", Matrix]()


def rlGetMatrixTransform() -> Matrix:
    return external_call["rlGetMatrixTransform", Matrix]()


def rlGetMatrixProjectionStereo(eye: Int32) -> Matrix:
    return external_call["rlGetMatrixProjectionStereo", Matrix](eye)


def rlGetMatrixViewOffsetStereo(eye: Int32) -> Matrix:
    return external_call["rlGetMatrixViewOffsetStereo", Matrix](eye)


def rlSetMatrixProjection(proj: Matrix):
    external_call["rlSetMatrixProjection", NoneType](proj)


def rlSetMatrixModelview(view: Matrix):
    external_call["rlSetMatrixModelview", NoneType](view)


def rlSetMatrixProjectionStereo(right: Matrix, left: Matrix):
    external_call["rlSetMatrixProjectionStereo", NoneType](right, left)


def rlSetMatrixViewOffsetStereo(right: Matrix, left: Matrix):
    external_call["rlSetMatrixViewOffsetStereo", NoneType](right, left)


def rlLoadDrawCube():
    external_call["rlLoadDrawCube", NoneType]()


def rlLoadDrawQuad():
    external_call["rlLoadDrawQuad", NoneType]()

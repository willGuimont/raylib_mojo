"""Low-level OpenGL abstraction layer (RLGL) API for Raylib in Mojo."""

from std.memory import Pointer
from raylib.types import Vector2, Vector3, Vector4, Matrix, Color
import raylib.c_rlgl as c_rlgl


def rl_matrix_mode(mode: Int32):
    """Wrap rlMatrixMode."""
    c_rlgl.rlMatrixMode(mode)


def rl_push_matrix():
    """Wrap rlPushMatrix."""
    c_rlgl.rlPushMatrix()


def rl_pop_matrix():
    """Wrap rlPopMatrix."""
    c_rlgl.rlPopMatrix()


def rl_load_identity():
    """Wrap rlLoadIdentity."""
    c_rlgl.rlLoadIdentity()


def rl_translatef(x: Float32, y: Float32, z: Float32):
    """Wrap rlTranslatef."""
    c_rlgl.rlTranslatef(x, y, z)


def rl_rotatef(angle: Float32, x: Float32, y: Float32, z: Float32):
    """Wrap rlRotatef."""
    c_rlgl.rlRotatef(angle, x, y, z)


def rl_scalef(x: Float32, y: Float32, z: Float32):
    """Wrap rlScalef."""
    c_rlgl.rlScalef(x, y, z)


def rl_mult_matrixf(matf: Pointer[Float32, origin=_]):
    """Wrap rlMultMatrixf."""
    c_rlgl.rlMultMatrixf(matf)


def rl_viewport(x: Int32, y: Int32, width: Int32, height: Int32):
    """Wrap rlViewport."""
    c_rlgl.rlViewport(x, y, width, height)


def rl_set_clip_planes(nearPlane: Float64, farPlane: Float64):
    """Wrap rlSetClipPlanes."""
    c_rlgl.rlSetClipPlanes(nearPlane, farPlane)


def rl_get_cull_distance_near() -> Float64:
    """Wrap rlGetCullDistanceNear."""
    return c_rlgl.rlGetCullDistanceNear()


def rl_get_cull_distance_far() -> Float64:
    """Wrap rlGetCullDistanceFar."""
    return c_rlgl.rlGetCullDistanceFar()


def rl_begin(mode: Int32):
    """Wrap rlBegin."""
    c_rlgl.rlBegin(mode)


def rl_end():
    """Wrap rlEnd."""
    c_rlgl.rlEnd()


def rl_vertex2i(x: Int32, y: Int32):
    """Wrap rlVertex2i."""
    c_rlgl.rlVertex2i(x, y)


def rl_vertex2f(x: Float32, y: Float32):
    """Wrap rlVertex2f."""
    c_rlgl.rlVertex2f(x, y)


def rl_vertex3f(x: Float32, y: Float32, z: Float32):
    """Wrap rlVertex3f."""
    c_rlgl.rlVertex3f(x, y, z)


def rl_tex_coord2f(x: Float32, y: Float32):
    """Wrap rlTexCoord2f."""
    c_rlgl.rlTexCoord2f(x, y)


def rl_normal3f(x: Float32, y: Float32, z: Float32):
    """Wrap rlNormal3f."""
    c_rlgl.rlNormal3f(x, y, z)


def rl_color4ub(r: UInt8, g: UInt8, b: UInt8, a: UInt8):
    """Wrap rlColor4ub."""
    c_rlgl.rlColor4ub(r, g, b, a)


def rl_color3f(x: Float32, y: Float32, z: Float32):
    """Wrap rlColor3f."""
    c_rlgl.rlColor3f(x, y, z)


def rl_color4f(x: Float32, y: Float32, z: Float32, w: Float32):
    """Wrap rlColor4f."""
    c_rlgl.rlColor4f(x, y, z, w)


def rl_enable_vertex_array(vaoId: UInt32) -> Bool:
    """Wrap rlEnableVertexArray."""
    return c_rlgl.rlEnableVertexArray(vaoId)


def rl_disable_vertex_array():
    """Wrap rlDisableVertexArray."""
    c_rlgl.rlDisableVertexArray()


def rl_enable_vertex_buffer(id: UInt32):
    """Wrap rlEnableVertexBuffer."""
    c_rlgl.rlEnableVertexBuffer(id)


def rl_disable_vertex_buffer():
    """Wrap rlDisableVertexBuffer."""
    c_rlgl.rlDisableVertexBuffer()


def rl_enable_vertex_buffer_element(id: UInt32):
    """Wrap rlEnableVertexBufferElement."""
    c_rlgl.rlEnableVertexBufferElement(id)


def rl_disable_vertex_buffer_element():
    """Wrap rlDisableVertexBufferElement."""
    c_rlgl.rlDisableVertexBufferElement()


def rl_enable_vertex_attribute(index: UInt32):
    """Wrap rlEnableVertexAttribute."""
    c_rlgl.rlEnableVertexAttribute(index)


def rl_disable_vertex_attribute(index: UInt32):
    """Wrap rlDisableVertexAttribute."""
    c_rlgl.rlDisableVertexAttribute(index)


def rl_disable_state_pointer(vertexAttribType: Int32):
    """Wrap rlDisableStatePointer."""
    c_rlgl.rlDisableStatePointer(vertexAttribType)


def rl_active_texture_slot(slot: Int32):
    """Wrap rlActiveTextureSlot."""
    c_rlgl.rlActiveTextureSlot(slot)


def rl_enable_texture(id: UInt32):
    """Wrap rlEnableTexture."""
    c_rlgl.rlEnableTexture(id)


def rl_disable_texture():
    """Wrap rlDisableTexture."""
    c_rlgl.rlDisableTexture()


def rl_enable_texture_cubemap(id: UInt32):
    """Wrap rlEnableTextureCubemap."""
    c_rlgl.rlEnableTextureCubemap(id)


def rl_disable_texture_cubemap():
    """Wrap rlDisableTextureCubemap."""
    c_rlgl.rlDisableTextureCubemap()


def rl_texture_parameters(id: UInt32, param: Int32, value: Int32):
    """Wrap rlTextureParameters."""
    c_rlgl.rlTextureParameters(id, param, value)


def rl_cubemap_parameters(id: UInt32, param: Int32, value: Int32):
    """Wrap rlCubemapParameters."""
    c_rlgl.rlCubemapParameters(id, param, value)


def rl_enable_shader(id: UInt32):
    """Wrap rlEnableShader."""
    c_rlgl.rlEnableShader(id)


def rl_disable_shader():
    """Wrap rlDisableShader."""
    c_rlgl.rlDisableShader()


def rl_enable_framebuffer(id: UInt32):
    """Wrap rlEnableFramebuffer."""
    c_rlgl.rlEnableFramebuffer(id)


def rl_disable_framebuffer():
    """Wrap rlDisableFramebuffer."""
    c_rlgl.rlDisableFramebuffer()


def rl_get_active_framebuffer() -> UInt32:
    """Wrap rlGetActiveFramebuffer."""
    return c_rlgl.rlGetActiveFramebuffer()


def rl_active_draw_buffers(count: Int32):
    """Wrap rlActiveDrawBuffers."""
    c_rlgl.rlActiveDrawBuffers(count)


def rl_bind_framebuffer(target: UInt32, framebuffer: UInt32):
    """Wrap rlBindFramebuffer."""
    c_rlgl.rlBindFramebuffer(target, framebuffer)


def rl_enable_color_blend():
    """Wrap rlEnableColorBlend."""
    c_rlgl.rlEnableColorBlend()


def rl_disable_color_blend():
    """Wrap rlDisableColorBlend."""
    c_rlgl.rlDisableColorBlend()


def rl_enable_depth_test():
    """Wrap rlEnableDepthTest."""
    c_rlgl.rlEnableDepthTest()


def rl_disable_depth_test():
    """Wrap rlDisableDepthTest."""
    c_rlgl.rlDisableDepthTest()


def rl_enable_depth_mask():
    """Wrap rlEnableDepthMask."""
    c_rlgl.rlEnableDepthMask()


def rl_disable_depth_mask():
    """Wrap rlDisableDepthMask."""
    c_rlgl.rlDisableDepthMask()


def rl_enable_backface_culling():
    """Wrap rlEnableBackfaceCulling."""
    c_rlgl.rlEnableBackfaceCulling()


def rl_disable_backface_culling():
    """Wrap rlDisableBackfaceCulling."""
    c_rlgl.rlDisableBackfaceCulling()


def rl_color_mask(r: Bool, g: Bool, b: Bool, a: Bool):
    """Wrap rlColorMask."""
    c_rlgl.rlColorMask(r, g, b, a)


def rl_set_cull_face(mode: Int32):
    """Wrap rlSetCullFace."""
    c_rlgl.rlSetCullFace(mode)


def rl_enable_scissor_test():
    """Wrap rlEnableScissorTest."""
    c_rlgl.rlEnableScissorTest()


def rl_disable_scissor_test():
    """Wrap rlDisableScissorTest."""
    c_rlgl.rlDisableScissorTest()


def rl_scissor(x: Int32, y: Int32, width: Int32, height: Int32):
    """Wrap rlScissor."""
    c_rlgl.rlScissor(x, y, width, height)


def rl_enable_point_mode():
    """Wrap rlEnablePointMode."""
    c_rlgl.rlEnablePointMode()


def rl_disable_point_mode():
    """Wrap rlDisablePointMode."""
    c_rlgl.rlDisablePointMode()


def rl_set_point_size(size: Float32):
    """Wrap rlSetPointSize."""
    c_rlgl.rlSetPointSize(size)


def rl_get_point_size() -> Float32:
    """Wrap rlGetPointSize."""
    return c_rlgl.rlGetPointSize()


def rl_enable_wire_mode():
    """Wrap rlEnableWireMode."""
    c_rlgl.rlEnableWireMode()


def rl_disable_wire_mode():
    """Wrap rlDisableWireMode."""
    c_rlgl.rlDisableWireMode()


def rl_set_line_width(width: Float32):
    """Wrap rlSetLineWidth."""
    c_rlgl.rlSetLineWidth(width)


def rl_get_line_width() -> Float32:
    """Wrap rlGetLineWidth."""
    return c_rlgl.rlGetLineWidth()


def rl_enable_smooth_lines():
    """Wrap rlEnableSmoothLines."""
    c_rlgl.rlEnableSmoothLines()


def rl_disable_smooth_lines():
    """Wrap rlDisableSmoothLines."""
    c_rlgl.rlDisableSmoothLines()


def rl_enable_stereo_render():
    """Wrap rlEnableStereoRender."""
    c_rlgl.rlEnableStereoRender()


def rl_disable_stereo_render():
    """Wrap rlDisableStereoRender."""
    c_rlgl.rlDisableStereoRender()


def rl_is_stereo_render_enabled() -> Bool:
    """Wrap rlIsStereoRenderEnabled."""
    return c_rlgl.rlIsStereoRenderEnabled()


def rl_clear_color(r: UInt8, g: UInt8, b: UInt8, a: UInt8):
    """Wrap rlClearColor."""
    c_rlgl.rlClearColor(r, g, b, a)


def rl_clear_screen_buffers():
    """Wrap rlClearScreenBuffers."""
    c_rlgl.rlClearScreenBuffers()


def rl_check_errors():
    """Wrap rlCheckErrors."""
    c_rlgl.rlCheckErrors()


def rl_set_blend_mode(mode: Int32):
    """Wrap rlSetBlendMode."""
    c_rlgl.rlSetBlendMode(mode)


def rlgl_init(width: Int32, height: Int32):
    """Wrap rlglInit."""
    c_rlgl.rlglInit(width, height)


def rlgl_close():
    """Wrap rlglClose."""
    c_rlgl.rlglClose()


def rl_load_extensions(loader: Pointer[NoneType, origin=_]):
    """Wrap rlLoadExtensions."""
    c_rlgl.rlLoadExtensions(loader)


def rl_get_version() -> Int32:
    """Wrap rlGetVersion."""
    return c_rlgl.rlGetVersion()


def rl_set_framebuffer_width(width: Int32):
    """Wrap rlSetFramebufferWidth."""
    c_rlgl.rlSetFramebufferWidth(width)


def rl_get_framebuffer_width() -> Int32:
    """Wrap rlGetFramebufferWidth."""
    return c_rlgl.rlGetFramebufferWidth()


def rl_set_framebuffer_height(height: Int32):
    """Wrap rlSetFramebufferHeight."""
    c_rlgl.rlSetFramebufferHeight(height)


def rl_get_framebuffer_height() -> Int32:
    """Wrap rlGetFramebufferHeight."""
    return c_rlgl.rlGetFramebufferHeight()


def rl_get_texture_id_default() -> UInt32:
    """Wrap rlGetTextureIdDefault."""
    return c_rlgl.rlGetTextureIdDefault()


def rl_get_shader_id_default() -> UInt32:
    """Wrap rlGetShaderIdDefault."""
    return c_rlgl.rlGetShaderIdDefault()


def rl_unload_render_batch(batch: Pointer[NoneType, origin=_]):
    """Wrap rlUnloadRenderBatch."""
    c_rlgl.rlUnloadRenderBatch(batch)


def rl_draw_render_batch(batch: Pointer[Pointer[NoneType, origin=_], origin=_]):
    """Wrap rlDrawRenderBatch."""
    c_rlgl.rlDrawRenderBatch(batch)


def rl_draw_render_batch_active():
    """Wrap rlDrawRenderBatchActive."""
    c_rlgl.rlDrawRenderBatchActive()


def rl_check_render_batch_limit(vCount: Int32) -> Bool:
    """Wrap rlCheckRenderBatchLimit."""
    return c_rlgl.rlCheckRenderBatchLimit(vCount)


def rl_set_texture(id: UInt32):
    """Wrap rlSetTexture."""
    c_rlgl.rlSetTexture(id)


def rl_load_vertex_array() -> UInt32:
    """Wrap rlLoadVertexArray."""
    return c_rlgl.rlLoadVertexArray()


def rl_unload_vertex_array(vaoId: UInt32):
    """Wrap rlUnloadVertexArray."""
    c_rlgl.rlUnloadVertexArray(vaoId)


def rl_unload_vertex_buffer(vboId: UInt32):
    """Wrap rlUnloadVertexBuffer."""
    c_rlgl.rlUnloadVertexBuffer(vboId)


def rl_set_vertex_attribute_divisor(index: UInt32, divisor: Int32):
    """Wrap rlSetVertexAttributeDivisor."""
    c_rlgl.rlSetVertexAttributeDivisor(index, divisor)


def rl_draw_vertex_array(offset: Int32, count: Int32):
    """Wrap rlDrawVertexArray."""
    c_rlgl.rlDrawVertexArray(offset, count)


def rl_draw_vertex_array_instanced(
    offset: Int32, count: Int32, instances: Int32
):
    """Wrap rlDrawVertexArrayInstanced."""
    c_rlgl.rlDrawVertexArrayInstanced(offset, count, instances)


def rl_unload_texture(id: UInt32):
    """Wrap rlUnloadTexture."""
    c_rlgl.rlUnloadTexture(id)


def rl_load_framebuffer() -> UInt32:
    """Wrap rlLoadFramebuffer."""
    return c_rlgl.rlLoadFramebuffer()


def rl_framebuffer_complete(id: UInt32) -> Bool:
    """Wrap rlFramebufferComplete."""
    return c_rlgl.rlFramebufferComplete(id)


def rl_unload_framebuffer(id: UInt32):
    """Wrap rlUnloadFramebuffer."""
    c_rlgl.rlUnloadFramebuffer(id)


def rl_resize_framebuffer(width: Int32, height: Int32):
    """Wrap rlResizeFramebuffer."""
    c_rlgl.rlResizeFramebuffer(width, height)


def rl_load_shader(code: Pointer[UInt8, origin=_], type_: Int32) -> UInt32:
    """Wrap rlLoadShader."""
    return c_rlgl.rlLoadShader(code, type_)


def rl_load_shader_program_ex(vsId: UInt32, fsId: UInt32) -> UInt32:
    """Wrap rlLoadShaderProgramEx."""
    return c_rlgl.rlLoadShaderProgramEx(vsId, fsId)


def rl_load_shader_program_compute(csId: UInt32) -> UInt32:
    """Wrap rlLoadShaderProgramCompute."""
    return c_rlgl.rlLoadShaderProgramCompute(csId)


def rl_unload_shader(id: UInt32):
    """Wrap rlUnloadShader."""
    c_rlgl.rlUnloadShader(id)


def rl_unload_shader_program(id: UInt32):
    """Wrap rlUnloadShaderProgram."""
    c_rlgl.rlUnloadShaderProgram(id)


def rl_set_uniform_matrix(locIndex: Int32, mat: Matrix):
    """Wrap rlSetUniformMatrix."""
    c_rlgl.rlSetUniformMatrix(locIndex, mat)


def rl_set_uniform_sampler(locIndex: Int32, textureId: UInt32):
    """Wrap rlSetUniformSampler."""
    c_rlgl.rlSetUniformSampler(locIndex, textureId)


def rl_set_shader(id: UInt32, locs: Pointer[Int32, origin=_]):
    """Wrap rlSetShader."""
    c_rlgl.rlSetShader(id, locs)


def rl_compute_shader_dispatch(groupX: UInt32, groupY: UInt32, groupZ: UInt32):
    """Wrap rlComputeShaderDispatch."""
    c_rlgl.rlComputeShaderDispatch(groupX, groupY, groupZ)


def rl_unload_shader_buffer(ssboId: UInt32):
    """Wrap rlUnloadShaderBuffer."""
    c_rlgl.rlUnloadShaderBuffer(ssboId)


def rl_bind_shader_buffer(id: UInt32, index: UInt32):
    """Wrap rlBindShaderBuffer."""
    c_rlgl.rlBindShaderBuffer(id, index)


def rl_get_shader_buffer_size(id: UInt32) -> UInt32:
    """Wrap rlGetShaderBufferSize."""
    return c_rlgl.rlGetShaderBufferSize(id)


def rl_get_matrix_modelview() -> Matrix:
    """Wrap rlGetMatrixModelview."""
    return c_rlgl.rlGetMatrixModelview()


def rl_get_matrix_projection() -> Matrix:
    """Wrap rlGetMatrixProjection."""
    return c_rlgl.rlGetMatrixProjection()


def rl_get_matrix_transform() -> Matrix:
    """Wrap rlGetMatrixTransform."""
    return c_rlgl.rlGetMatrixTransform()


def rl_get_matrix_projection_stereo(eye: Int32) -> Matrix:
    """Wrap rlGetMatrixProjectionStereo."""
    return c_rlgl.rlGetMatrixProjectionStereo(eye)


def rl_get_matrix_view_offset_stereo(eye: Int32) -> Matrix:
    """Wrap rlGetMatrixViewOffsetStereo."""
    return c_rlgl.rlGetMatrixViewOffsetStereo(eye)


def rl_set_matrix_projection(proj: Matrix):
    """Wrap rlSetMatrixProjection."""
    c_rlgl.rlSetMatrixProjection(proj)


def rl_set_matrix_modelview(view: Matrix):
    """Wrap rlSetMatrixModelview."""
    c_rlgl.rlSetMatrixModelview(view)


def rl_set_matrix_projection_stereo(right: Matrix, left: Matrix):
    """Wrap rlSetMatrixProjectionStereo."""
    c_rlgl.rlSetMatrixProjectionStereo(right, left)


def rl_set_matrix_view_offset_stereo(right: Matrix, left: Matrix):
    """Wrap rlSetMatrixViewOffsetStereo."""
    c_rlgl.rlSetMatrixViewOffsetStereo(right, left)


def rl_load_draw_cube():
    """Wrap rlLoadDrawCube."""
    c_rlgl.rlLoadDrawCube()


def rl_load_draw_quad():
    """Wrap rlLoadDrawQuad."""
    c_rlgl.rlLoadDrawQuad()

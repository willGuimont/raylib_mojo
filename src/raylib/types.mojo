"""Raylib primitive types and C-compatible structs."""

from std.ffi import c_int, c_uint, c_float, c_char

# ===-----------------------------------------------------------------------===#
# Vector2
# ===-----------------------------------------------------------------------===#


struct Vector2(ImplicitlyCopyable, TrivialRegisterPassable):
    """Vector2 type (2 float components)."""

    var x: Float32
    var y: Float32

    def __init__(out self, x: Float32 = 0.0, y: Float32 = 0.0):
        self.x = x
        self.y = y

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.x, existing.y)


# ===-----------------------------------------------------------------------===#
# Vector3
# ===-----------------------------------------------------------------------===#


struct Vector3(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.x, existing.y, existing.z)


# ===-----------------------------------------------------------------------===#
# Vector4
# ===-----------------------------------------------------------------------===#


struct Vector4(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.x, existing.y, existing.z, existing.w)


# ===-----------------------------------------------------------------------===#
# Quaternion
# ===-----------------------------------------------------------------------===#


struct Quaternion(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.x, existing.y, existing.z, existing.w)


# ===-----------------------------------------------------------------------===#
# Matrix
# ===-----------------------------------------------------------------------===#


struct Matrix(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.m0 = existing.m0
        self.m4 = existing.m4
        self.m8 = existing.m8
        self.m12 = existing.m12
        self.m1 = existing.m1
        self.m5 = existing.m5
        self.m9 = existing.m9
        self.m13 = existing.m13
        self.m2 = existing.m2
        self.m6 = existing.m6
        self.m10 = existing.m10
        self.m14 = existing.m14
        self.m3 = existing.m3
        self.m7 = existing.m7
        self.m11 = existing.m11
        self.m15 = existing.m15


# ===-----------------------------------------------------------------------===#
# Color
# ===-----------------------------------------------------------------------===#


struct Color(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.r, existing.g, existing.b, existing.a)


# ===-----------------------------------------------------------------------===#
# Rectangle
# ===-----------------------------------------------------------------------===#


struct Rectangle(ImplicitlyCopyable, TrivialRegisterPassable):
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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.x, existing.y, existing.width, existing.height)


# ===-----------------------------------------------------------------------===#
# Image
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.data = existing.data
        self.width = existing.width
        self.height = existing.height
        self.mipmaps = existing.mipmaps
        self.format = existing.format


# ===-----------------------------------------------------------------------===#
# Texture
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.id = existing.id
        self.width = existing.width
        self.height = existing.height
        self.mipmaps = existing.mipmaps
        self.format = existing.format


# ===-----------------------------------------------------------------------===#
# RenderTexture
# ===-----------------------------------------------------------------------===#


struct RenderTexture(ImplicitlyCopyable, TrivialRegisterPassable):
    """RenderTexture2D type (render target for 2D/3D)."""

    var id: UInt32
    var texture: Texture
    var depth: Texture

    def __init__(out self):
        self.id = 0
        self.texture = Texture()
        self.depth = Texture()

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.id = existing.id
        self.texture = existing.texture
        self.depth = existing.depth


# ===-----------------------------------------------------------------------===#
# NPatchInfo
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.source = existing.source
        self.left = existing.left
        self.top = existing.top
        self.right = existing.right
        self.bottom = existing.bottom
        self.layout = existing.layout


# ===-----------------------------------------------------------------------===#
# GlyphInfo
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.value = existing.value
        self.offsetX = existing.offsetX
        self.offsetY = existing.offsetY
        self.advanceX = existing.advanceX
        self.image = existing.image


# ===-----------------------------------------------------------------------===#
# Font
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.baseSize = existing.baseSize
        self.glyphCount = existing.glyphCount
        self.glyphPadding = existing.glyphPadding
        self.texture = existing.texture
        self.recs = existing.recs
        self.glyphs = existing.glyphs


# ===-----------------------------------------------------------------------===#
# Camera3D
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(
            existing.position,
            existing.target,
            existing.up,
            existing.fovy,
            existing.projection,
        )


# ===-----------------------------------------------------------------------===#
# Camera2D
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(
            existing.offset, existing.target, existing.rotation, existing.zoom
        )


# ===-----------------------------------------------------------------------===#
# Mesh
# ===-----------------------------------------------------------------------===#


struct Mesh(ImplicitlyCopyable, TrivialRegisterPassable):
    """Mesh type (vertex and triangle data)."""

    var vertexCount: Int32
    var triangleCount: Int32

    def __init__(out self):
        self.vertexCount = 0
        self.triangleCount = 0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.vertexCount = existing.vertexCount
        self.triangleCount = existing.triangleCount


# ===-----------------------------------------------------------------------===#
# Shader
# ===-----------------------------------------------------------------------===#


struct Shader(ImplicitlyCopyable, TrivialRegisterPassable):
    """Shader type (compiled shader program)."""

    var id: UInt32
    var locs: Int

    def __init__(out self):
        self.id = 0
        self.locs = 0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.id = existing.id
        self.locs = existing.locs


# ===-----------------------------------------------------------------------===#
# MaterialMap
# ===-----------------------------------------------------------------------===#


struct MaterialMap(ImplicitlyCopyable, TrivialRegisterPassable):
    """MaterialMap type (texture, color, value)."""

    var texture: Texture
    var color: Color
    var value: Float32

    def __init__(out self):
        self.texture = Texture()
        self.color = Color()
        self.value = 0.0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.texture = existing.texture
        self.color = existing.color
        self.value = existing.value


# ===-----------------------------------------------------------------------===#
# Material
# ===-----------------------------------------------------------------------===#


struct Material(ImplicitlyCopyable, TrivialRegisterPassable):
    """Material type (shader and material maps)."""

    var shader: Shader
    var maps: Int
    var params: Int

    def __init__(out self):
        self.shader = Shader()
        self.maps = 0
        self.params = 0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.shader = existing.shader
        self.maps = existing.maps
        self.params = existing.params


# ===-----------------------------------------------------------------------===#
# Model
# ===-----------------------------------------------------------------------===#


struct Model(ImplicitlyCopyable, TrivialRegisterPassable):
    """Model type (3D mesh and material hierarchy)."""

    var transform: Matrix
    var meshCount: Int32
    var materialCount: Int32

    def __init__(out self):
        self.transform = Matrix()
        self.meshCount = 0
        self.materialCount = 0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.transform = existing.transform
        self.meshCount = existing.meshCount
        self.materialCount = existing.materialCount


# ===-----------------------------------------------------------------------===#
# Ray
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.position, existing.direction)


# ===-----------------------------------------------------------------------===#
# RayCollision
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.hit = existing.hit
        self.distance = existing.distance
        self.point = existing.point
        self.normal = existing.normal


# ===-----------------------------------------------------------------------===#
# BoundingBox
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self(existing.min, existing.max)


# ===-----------------------------------------------------------------------===#
# Wave
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.frameCount = existing.frameCount
        self.sampleRate = existing.sampleRate
        self.sampleSize = existing.sampleSize
        self.channels = existing.channels
        self.data = existing.data


# ===-----------------------------------------------------------------------===#
# AudioStream
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.buffer = existing.buffer
        self.processor = existing.processor
        self.sampleRate = existing.sampleRate
        self.sampleSize = existing.sampleSize
        self.channels = existing.channels


# ===-----------------------------------------------------------------------===#
# Sound
# ===-----------------------------------------------------------------------===#


struct Sound(ImplicitlyCopyable, TrivialRegisterPassable):
    """Sound audio source type."""

    var stream: AudioStream
    var frameCount: UInt32

    def __init__(out self):
        self.stream = AudioStream()
        self.frameCount = 0

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.stream = existing.stream
        self.frameCount = existing.frameCount


# ===-----------------------------------------------------------------------===#
# Music
# ===-----------------------------------------------------------------------===#


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

    def __copyinit__(out self: Self, existing: Self):
        self = Self()
        self.stream = existing.stream
        self.frameCount = existing.frameCount
        self.looping = existing.looping
        self.ctxType = existing.ctxType
        self.ctxData = existing.ctxData

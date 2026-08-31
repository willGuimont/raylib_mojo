"""High-level Pythonic Mojo wrappers for 3D Models, Meshes, Animations, FilePathLists, and AutomationEvents."""

import raylib.c as c
from raylib.types import (
    Model,
    Mesh,
    Material,
    Texture,
    Vector3,
    Color,
    Matrix,
    ModelAnimation,
    FilePathList,
    AutomationEventList,
    AutomationEvent,
)
from std.origin import ImmutAnyOrigin
from std.memory import Pointer


def load_model(file_name: String) -> Model:
    """Loads a 3D model from file."""
    return c.LoadModel(file_name.unsafe_uint8_ptr())


def load_model_from_mesh(mesh: Mesh) -> Model:
    """Loads a 3D model from a procedural mesh."""
    return c.LoadModelFromMesh(mesh)


def draw_model(
    model: Model,
    position: Vector3 = Vector3(0.0, 0.0, 0.0),
    scale: Float32 = 1.0,
    tint: Color = Color(255, 255, 255, 255),
):
    """Draws a 3D model at position with scale and tint color."""
    c.DrawModel(model, position, scale, tint)


def draw_model_wires(
    model: Model,
    position: Vector3 = Vector3(0.0, 0.0, 0.0),
    scale: Float32 = 1.0,
    tint: Color = Color(80, 80, 80, 255),
):
    """Draws a 3D model wireframe at position with scale and tint color."""
    c.DrawModelWires(model, position, scale, tint)


def draw_model_ex(
    model: Model,
    position: Vector3,
    rotation_axis: Vector3,
    rotation_angle: Float32,
    scale: Vector3,
    tint: Color = Color(255, 255, 255, 255),
):
    """Draws a 3D model with extended transform options."""
    c.DrawModelEx(model, position, rotation_axis, rotation_angle, scale, tint)


def set_model_material_texture(
    model: Model,
    map_type: Int32,
    texture: Texture,
):
    """Sets a material texture for a model map type (0 = diffuse/albedo)."""
    c.SetMaterialTexture(
        Pointer[c.Material, origin=ImmutAnyOrigin](
            unsafe_from_address=model.materials
        ),
        map_type,
        texture,
    )


def set_model_texture(model: Model, texture: Texture):
    """Convenience helper to set the primary diffuse/albedo texture on a model.
    """
    set_model_material_texture(model, 0, texture)


def unload_model(model: Model):
    """Unloads a 3D model from VRAM/RAM."""
    c.UnloadModel(model)


def gen_mesh_plane(
    width: Float32, length: Float32, res_x: Int32 = 2, res_z: Int32 = 2
) -> Mesh:
    """Generates a plane mesh with subdivisions."""
    return c.GenMeshPlane(width, length, res_x, res_z)


def gen_mesh_cube(width: Float32, height: Float32, length: Float32) -> Mesh:
    """Generates a 3D cube mesh."""
    return c.GenMeshCube(width, height, length)


def gen_mesh_sphere(
    radius: Float32, rings: Int32 = 16, slices: Int32 = 16
) -> Mesh:
    """Generates a 3D sphere mesh."""
    return c.GenMeshSphere(radius, rings, slices)


def gen_mesh_cylinder(
    radius: Float32, height: Float32, slices: Int32 = 16
) -> Mesh:
    """Generates a 3D cylinder mesh."""
    return c.GenMeshCylinder(radius, height, slices)


def gen_mesh_torus(
    radius: Float32, size: Float32, rad_seg: Int32 = 16, sides: Int32 = 16
) -> Mesh:
    """Generates a 3D torus mesh."""
    return c.GenMeshTorus(radius, size, rad_seg, sides)


def gen_mesh_knot(
    radius: Float32, size: Float32, rad_seg: Int32 = 16, sides: Int32 = 32
) -> Mesh:
    """Generates a 3D knot mesh."""
    return c.GenMeshKnot(radius, size, rad_seg, sides)


def gen_mesh_poly(sides: Int32, radius: Float32) -> Mesh:
    """Generates a 2D/3D polygon mesh."""
    return c.GenMeshPoly(sides, radius)


def draw_mesh(mesh: Mesh, material: Material, transform: Matrix):
    """Draws a 3D mesh with material and transform matrix."""
    c.DrawMesh(mesh, material, transform)


def unload_mesh(mesh: Mesh):
    """Unloads a 3D mesh from VRAM/RAM."""
    c.UnloadMesh(mesh)


def update_model_animation(model: Model, anim: ModelAnimation, frame: Int32):
    """Updates model animation pose for a specific frame."""
    c.UpdateModelAnimation(model, anim, frame)


def is_model_animation_valid(model: Model, anim: ModelAnimation) -> Bool:
    """Checks if a model animation matches a model skeleton."""
    return c.IsModelAnimationValid(model, anim)


def unload_model_animation(anim: ModelAnimation):
    """Unloads a model animation sequence."""
    c.UnloadModelAnimation(anim)


def load_directory_files(dir_path: String) -> FilePathList:
    """Loads directory filepaths list."""
    return c.LoadDirectoryFiles(dir_path.unsafe_uint8_ptr())


def load_dropped_files() -> FilePathList:
    """Loads dropped filepaths list."""
    return c.LoadDroppedFiles()


def unload_file_path_list(files: FilePathList):
    """Unloads filepaths list from memory."""
    c.UnloadFilePathList(files)


def load_automation_event_list(file_name: String = "") -> AutomationEventList:
    """Loads an automation event list from file or creates an empty list."""
    if len(file_name) == 0:
        return c.LoadAutomationEventList(
            Pointer[UInt8, origin=ImmutAnyOrigin]()
        )
    return c.LoadAutomationEventList(file_name.unsafe_uint8_ptr())


def unload_automation_event_list(events: AutomationEventList):
    """Unloads automation event list from memory."""
    c.UnloadAutomationEventList(events)

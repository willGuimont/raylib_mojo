from std.ffi import OwnedDLHandle


def map_c_type_to_mojo(c_type_str: String) -> String:
    var c_type = String(c_type_str.strip())
    c_type = String(c_type.replace("const ", "").strip())
    c_type = String(c_type.replace("struct ", "").strip())

    if c_type == "Texture2D" or c_type == "TextureCubemap":
        return "Texture"
    if c_type == "RenderTexture2D":
        return "RenderTexture"
    if c_type == "Camera":
        return "Camera3D"
    if c_type == "Quaternion":
        return "Vector4"

    if c_type == "void":
        return "NoneType"
    if c_type == "bool":
        return "Bool"
    if c_type == "int" or c_type == "signed int":
        return "Int32"
    if c_type == "unsigned int" or c_type == "unsigned":
        return "UInt32"
    if c_type == "float":
        return "Float32"
    if c_type == "double":
        return "Float64"
    if c_type == "char":
        return "Int8"
    if c_type == "unsigned char":
        return "UInt8"
    if c_type == "short" or c_type == "signed short":
        return "Int16"
    if c_type == "unsigned short":
        return "UInt16"
    if c_type == "long" or c_type == "long long":
        return "Int64"
    if c_type == "unsigned long" or c_type == "unsigned long long":
        return "UInt64"

    if (
        c_type == "Vector2"
        or c_type == "Vector3"
        or c_type == "Vector4"
        or c_type == "Matrix"
        or c_type == "Color"
        or c_type == "Rectangle"
        or c_type == "Image"
        or c_type == "Texture"
        or c_type == "RenderTexture"
        or c_type == "NPatchInfo"
        or c_type == "GlyphInfo"
        or c_type == "Font"
        or c_type == "Camera3D"
        or c_type == "Camera2D"
        or c_type == "Mesh"
        or c_type == "Shader"
        or c_type == "MaterialMap"
        or c_type == "Material"
        or c_type == "Transform"
        or c_type == "BoneInfo"
        or c_type == "Model"
        or c_type == "ModelAnimation"
        or c_type == "Ray"
        or c_type == "RayCollision"
        or c_type == "BoundingBox"
        or c_type == "Wave"
        or c_type == "AudioStream"
        or c_type == "Sound"
        or c_type == "Music"
        or c_type == "VrDeviceInfo"
        or c_type == "VrStereoConfig"
        or c_type == "FilePathList"
        or c_type == "AutomationEvent"
        or c_type == "AutomationEventList"
    ):
        return String(c_type)

    if c_type.endswith("**"):
        return "Pointer[Pointer[UInt8, origin=_], origin=_]"
    if c_type.endswith("*"):
        var inner = String(c_type[byte = 0 : c_type.byte_length() - 1].strip())
        var inner_mojo = map_c_type_to_mojo(inner)
        if (
            inner_mojo == "Int8"
            or inner_mojo == "UInt8"
            or inner_mojo == "char"
        ):
            return "Pointer[UInt8, origin=_]"
        elif inner_mojo == "NoneType":
            return "Pointer[NoneType, origin=_]"
        else:
            return "Pointer[" + inner_mojo + ", origin=_]"

    if "Callback" in c_type or "proc" in c_type.lower():
        return "Pointer[NoneType, origin=_]"

    return "Int32"


def sanitize_name(name_str: String) -> String:
    var n = String(name_str.strip())
    if (
        n == "fn"
        or n == "var"
        or n == "let"
        or n == "struct"
        or n == "alias"
        or n == "in"
        or n == "out"
        or n == "owned"
        or n == "ref"
        or n == "borrowed"
        or n == "type"
        or n == "raises"
        or n == "def"
        or n == "from"
        or n == "import"
        or n == "as"
        or n == "with"
        or n == "if"
        or n == "else"
        or n == "while"
        or n == "for"
        or n == "return"
        or n == "break"
        or n == "continue"
        or n == "pass"
        or n == "try"
        or n == "except"
        or n == "finally"
        or n == "raise"
        or n == "is"
        or n == "not"
        or n == "and"
        or n == "or"
    ):
        return n + "_"
    return String(n)


def main() raises:
    print("=== Raylib Mojo Automatic Binding Generator ===")
    var header_path = "third_party/raylib/src/raylib.h"
    var f = open(header_path, "r")
    var text = f.read()
    f.close()

    var lib_path = "build/raylib/raylib/libraylib.so"
    var handle = OwnedDLHandle(lib_path)
    print("Loaded shared object and verified symbols.")

    var raw_lines = text.split("\n")
    var clean_lines = List[String]()
    for i in range(len(raw_lines)):
        var line = String(raw_lines[i].strip())
        var c_idx = line.find("//")
        if c_idx != -1:
            var code_part = String(line[byte=0:c_idx].strip())
            if code_part.byte_length() > 0:
                clean_lines.append(code_part)
        else:
            if line.byte_length() > 0:
                clean_lines.append(line)

    var full_decls = List[String]()
    var idx = 0
    while idx < len(clean_lines):
        var line = clean_lines[idx]
        if line.startswith("RLAPI "):
            var decl = String(line)
            while not decl.endswith(";") and idx + 1 < len(clean_lines):
                idx += 1
                decl = decl + " " + clean_lines[idx]
            full_decls.append(decl)
        idx += 1

    print("Parsed", len(full_decls), "RLAPI declarations from raylib.h.")

    var out_file = open("src/raylib/c.mojo", "w")
    out_file.write(
        "from std.ffi import external_call, c_int, c_float, c_char\n"
    )
    out_file.write("from std.memory import Pointer\n")
    out_file.write("from raylib.types import (\n")
    out_file.write(
        "    Vector2,\n    Vector3,\n    Vector4,\n    Color,\n    Rectangle,\n"
    )
    out_file.write(
        "    Camera2D,\n    Camera3D,\n    Image,\n    Texture,\n   "
        " RenderTexture,\n"
    )
    out_file.write(
        "    NPatchInfo,\n    GlyphInfo,\n    Font,\n    Mesh,\n    Shader,\n"
    )
    out_file.write(
        "    MaterialMap,\n    Material,\n    Transform,\n    BoneInfo,\n   "
        " Model,\n"
    )
    out_file.write(
        "    ModelAnimation,\n    Ray,\n    RayCollision,\n    BoundingBox,\n"
    )
    out_file.write(
        "    Wave,\n    AudioStream,\n    Sound,\n    Music,\n   "
        " VrDeviceInfo,\n"
    )
    out_file.write(
        "    VrStereoConfig,\n    FilePathList,\n    AutomationEvent,\n   "
        " AutomationEventList,\n"
    )
    out_file.write(")\n\n")

    var verified_count = 0
    for i in range(len(full_decls)):
        var decl = full_decls[i]
        var paren_idx = decl.find("(")
        var close_paren_idx = decl.rfind(")")
        if paren_idx != -1 and close_paren_idx != -1:
            var before_paren = String(decl[byte=0:paren_idx].strip())
            before_paren = String(before_paren.replace("*", " * "))
            var space_idx = before_paren.rfind(" ")
            if space_idx != -1:
                var func_name = String(
                    before_paren[byte = space_idx + 1 :].strip()
                )
                var ret_c = String(before_paren[byte=0:space_idx].strip())
                ret_c = String(ret_c.replace("RLAPI", "").strip())
                ret_c = String(ret_c.replace(" *", "*").strip())

                if handle.check_symbol(func_name):
                    verified_count += 1

                var ret_mojo = map_c_type_to_mojo(ret_c)

                var params_raw = String(
                    decl[byte = paren_idx + 1 : close_paren_idx].strip()
                )
                var param_defs = String("")
                var param_args = String("")

                if params_raw.byte_length() > 0 and params_raw != "void":
                    var raw_parts = params_raw.split(",")
                    for p_i in range(len(raw_parts)):
                        var raw_p = String(raw_parts[p_i].strip())
                        raw_p = String(raw_p.replace("*", " * "))
                        var p_space = raw_p.rfind(" ")
                        if p_space != -1:
                            var p_type_c = String(raw_p[byte=0:p_space].strip())
                            p_type_c = String(
                                p_type_c.replace(" *", "*").strip()
                            )
                            var p_name_c = String(
                                raw_p[byte = p_space + 1 :].strip()
                            )

                            var p_type_mojo = map_c_type_to_mojo(p_type_c)
                            var p_name_mojo = sanitize_name(p_name_c)

                            if p_i > 0:
                                param_defs = param_defs + ", "
                                param_args = param_args + ", "
                            param_defs = (
                                param_defs + p_name_mojo + ": " + p_type_mojo
                            )
                            param_args = param_args + p_name_mojo

                out_file.write("def " + func_name + "(" + param_defs + ")")
                if ret_mojo != "NoneType":
                    out_file.write(" -> " + ret_mojo + ":\n")
                    out_file.write(
                        '    return external_call["'
                        + func_name
                        + '", '
                        + ret_mojo
                        + "]("
                        + param_args
                        + ")\n\n"
                    )
                else:
                    out_file.write(":\n")
                    out_file.write(
                        '    external_call["'
                        + func_name
                        + '", NoneType]('
                        + param_args
                        + ")\n\n"
                    )

    out_file.close()

    print("Verified in libraylib.so", verified_count, "/", len(full_decls))
    print("Successfully generated Mojo C FFI wrappers into src/raylib/c.mojo")

# Thin wrapper so pixi can build the vendored raylib as a package: `pixi install`
# compiles third_party/raylib and installs libraylib into the environment's lib/
cmake_minimum_required(VERSION 3.16)
project(raylib_shim C)

set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS ON CACHE BOOL "" FORCE)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/raylib
                 ${CMAKE_CURRENT_BINARY_DIR}/raylib)

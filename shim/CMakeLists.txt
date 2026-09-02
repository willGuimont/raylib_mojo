# Thin wrapper so pixi can build vendored raylib and raygui as packages: `pixi install`
# compiles third_party/raylib and third_party/raygui and installs libraylib into the environment's lib/
cmake_minimum_required(VERSION 3.16)
project(raylib_shim C)

set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS ON CACHE BOOL "" FORCE)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../third_party/raylib
                 ${CMAKE_CURRENT_BINARY_DIR}/raylib)

add_library(raygui SHARED ${CMAKE_CURRENT_SOURCE_DIR}/raygui_impl.c)
target_include_directories(raygui PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/raygui/src
    ${CMAKE_CURRENT_SOURCE_DIR}/../third_party/raylib/src
)
target_link_libraries(raygui PRIVATE raylib)

install(TARGETS raygui DESTINATION lib)


![raylib mojo logo](logo/raylib_mojo_logo.png)

# raylib_mojo

[![CI](https://github.com/willGuimont/raylib_mojo/actions/workflows/ci.yml/badge.svg)](https://github.com/willGuimont/raylib_mojo/actions/workflows/ci.yml)
[![raylib version](https://img.shields.io/badge/raylib-v6.0-dev)](https://github.com/raysan5/raylib)
[![mojo version](https://img.shields.io/badge/mojo-v1.0-orange.svg)](https://mojolang.org)
[![pixi](https://img.shields.io/badge/pixi-package_manager-purple.svg)](https://pixi.sh)
[![license](https://img.shields.io/badge/license-zlib-green.svg)](LICENSE)

**Mojo bindings for [raylib](https://www.raylib.com/)**, a simple and easy-to-use library to enjoy videogames programming.

## Quick Example

```mojo
from raylib import (
    init_window, window_should_close, close_window, set_target_fps,
    begin_drawing, end_drawing, clear_background, draw_text, draw_fps,
    RAYWHITE, DARKGRAY, LIGHTGRAY, MAROON
)

def main():
    # Initialize window
    init_window(800, 450, "raylib [core] example - basic window")
    set_target_fps(60)

    # Main game loop
    while not window_should_close():
        begin_drawing()
        clear_background(RAYWHITE())

        draw_text("Congrats! You created your first raylib + mojo window!", 120, 200, 20, DARKGRAY())
        draw_fps(10, 10)

        end_drawing()

    # De-initialization
    close_window()
```

## Getting Started

### Prerequisites

All build dependencies and the Mojo environment are automatically managed by [Pixi](https://pixi.sh).

```bash
# Verify pixi is installed
pixi --version
```

### Building

Clone the repository with submodules and install the environment:

```bash
git clone --recursive https://github.com/willGuimont/raylib_mojo.git
cd raylib_mojo

# Builds the vendored raylib into the environment
pixi install
```

`pixi install` compiles `third_party/raylib` through the [`shim/`](shim) package and installs `libraylib.so` into the environment.

---

## How to Use `raylib_mojo` in Your Projects

`raylib_mojo` is published on [mojoshelf](https://mojoshelf.org/tins/raylib_mojo) as a "tin".
You can use it in your own Mojo + Pixi project in three steps.

### 1. Add `raylib_mojo` to Your Project

With the [shelf](https://mojoshelf.org/getting-started) extension, which vendors the tin at the revision the registry has pinned:

```bash
pixi global install --channel https://mojoshelf.org/channel mojoshelf
shelf add raylib_mojo
git submodule update --init --recursive   # required to pull raylib itself as a submodule
```

Or as a plain git submodule:

```bash
git submodule add https://github.com/willGuimont/raylib_mojo third_party/raylib_mojo
git submodule update --init --recursive
```

### 2. Configure `pixi.toml` / `mojoproject.toml`

Depend on the `shim` package that ships with `raylib_mojo`. Pixi builds raylib
and installs `libraylib.so` into your environment.

When added via `shelf add` (which places tins in `shelf/raylib_mojo/`):

```toml
[workspace]
name = "my_mojo_game"
version = "0.1.0"
channels = ["conda-forge", "https://conda.modular.com/max"]
platforms = ["linux-64"]
preview = ["pixi-build"]

[dependencies]
max = ">=26.5.0"
mojo = ">=1.0.0"
# Builds shelf/raylib_mojo/shim into the environment.
raylib-shim = { path = "shelf/raylib_mojo/shim" }

[tasks]
start = "mojo run -I shelf/raylib_mojo/src -Xlinker -L$CONDA_PREFIX/lib -Xlinker -lraylib main.mojo"
```

*(Note: If you added `raylib_mojo` as a Git submodule in `third_party/raylib_mojo`, use `third_party/raylib_mojo/shim` and `third_party/raylib_mojo/src` instead).*

`libraylib.so` lives in the environment, so the linker needs `-L$CONDA_PREFIX/lib`.

### 3. Build & Run Your Project

```bash
pixi run start
```

Pixi builds raylib on first install, then launches your Mojo application.

---

## GPU & Compute Kernel Demos

Examples demonstrating GPU acceleration combining MAX `DeviceContext` / `std.gpu` kernels with Raylib framebuffer rendering:

| Mandelbrot & Julia Fractals (`pixi run example-gpu-mandelbrot`) | N-Body Galaxy Simulation (`pixi run example-gpu-nbody`) |
| :---: | :---: |
| ![Mandelbrot GPU Kernel](media/gpu_mandelbrot.png) | ![N-Body Galaxy GPU Kernel](media/gpu_nbody.gif) |

| Real-Time Sphere Raytracer (`pixi run example-gpu-raytracer`) | Reaction-Diffusion PDE (`pixi run example-gpu-reaction-diffusion`) |
| :---: | :---: |
| ![Sphere Raytracer GPU Kernel](media/gpu_raytracer.png) | ![Reaction-Diffusion PDE GPU Kernel](media/gpu_reaction_diffusion.gif) |

| 32k Waving Cubes GPU Kernel (`pixi run example-gpu-waving-cubes`) |
| :---: |
| ![32k Waving Cubes GPU Kernel](media/gpu_waving_cubes.gif) |

---

## Examples

Run any of the included examples using Pixi tasks:

### Standard Examples

| Example / Task | Command | Description |
| :--- | :--- | :--- |
| **Logo Generator** | `pixi run example-logo` | Generates the official raylib-mojo brand logo |
| **Basic Window** | `pixi run example-window` | Basic window creation and text rendering |
| **Bouncing Ball** | `pixi run example-bouncing-ball` | 2D physics and vector movement simulation |
| **2D Collision** | `pixi run example-collision` | Mouse collision detection with rectangles & circles |
| **2D Camera** | `pixi run example-camera-2d` | 2D Camera panning, target tracking & mouse zoom |
| **3D Shapes** | `pixi run example-3d` | 3D rendering with Camera3D, 3D shapes & grid |
| **Audio Stream** | `pixi run example-audio-stream` | Real-time audio waveform synthesis and stream playback |
| **Sprite Animation** | `pixi run example-sprite-anim` | 2D sprite sheet animation, frame clipping & speed control |
| **Particle Assembly** | `pixi run example-particle-assembly` | Interactive 2D physics simulation with 1,200 particles & mouse forces |
| **Game of Life** | `pixi run example-game-of-life` | Conway's Game of Life cellular automata simulation |
| **Waving Cubes** | `pixi run example-waving-cubes` | 3D procedural cube wave simulation with HSV color palette |
| **Mesh Generation** | `pixi run example-mesh-generation` | Procedural 3D mesh generation (plane, cube, sphere, torus, knot, poly) |

### Mojo GPU & Compute Kernel Examples

| Example / Task | Command | Description |
| :--- | :--- | :--- |
| **Mandelbrot & Julia Fractals** | `pixi run example-gpu-mandelbrot` | Per-pixel parallel compute kernel calculating 480,000 complex iterations per frame with real-time zooming & panning |
| **N-Body Gravity Galaxy** | `pixi run example-gpu-nbody` | $O(N^2)$ pairwise gravitational force summation kernel evaluating 2.5+ million star interaction vectors per frame |
| **Real-Time Sphere Raytracer** | `pixi run example-gpu-raytracer` | Per-pixel ray casting, sphere intersection, specular lighting, and reflection bounce compute kernel (240,000+ rays/frame) |
| **Reaction-Diffusion PDE** | `pixi run example-gpu-reaction-diffusion` | 2D Gray-Scott partial differential equation kernel with 9-point Laplacian stencil convolution for dynamic organic pattern growth |
| **32k Waving Cubes GPU** | `pixi run example-gpu-waving-cubes` | Evaluates 32k (32,768) parallel CUDA threads across 3D blocks computing wave dynamics, scatter vectors, scaling, and HSV colors |

---

## Development

### Automatic Binding Generation

`raylib_mojo` includes a pure Mojo automatic binding generator script ([scripts/generate_bindings.mojo](scripts/generate_bindings.mojo)) that parses Raylib's C declarations from `raylib.h`, `raymath.h`, `rlgl.h`, `rcamera.h`, and `rgestures.h`, maps C types to Mojo types, and verifies each symbol dynamically against `libraylib.so`.

To regenerate the bindings:

```bash
# Regenerates bindings into src/raylib/ against the environment's libraylib.so
pixi run generate-bindings
```

### Publish on [mojoshelf](https://mojoshelf.org/tins/raylib_mojo)

```bash
# Once pushed to master, run
shelf publish
```

---

## Contributing

Feel free to open an issue. If you'd like to contribute, please fork the repository and make
changes as you'd like. Pull requests are welcome.

If you want to request features or report bugs related to raylib directly (in contrast to this binding), please refer to the [author's project repo](https://github.com/raysan5/raylib).

## License

See [LICENSE](LICENSE.md) for details.

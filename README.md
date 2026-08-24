![raylib mojo logo](logo/raylib_mojo_logo.png)

# raylib-mojo

[![raylib version](https://img.shields.io/badge/raylib-v6.1--dev-blue.svg)](https://github.com/raysan5/raylib)
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

### Building Raylib

Clone the repository with submodules and build the shared dynamic library:

```bash
git clone --recursive https://github.com/willGuimont/mojo_raylib.git
cd mojo_raylib

# Build raylib shared library
pixi run build-raylib
```

### Using in Your Own Pixi Project

To use `raylib-mojo` in your own Pixi + Mojo project:

#### 1. Add `raylib_mojo` as a submodule

In your project root, add `raylib_mojo` (and its submodules) to a subdirectory such as `third_party/`:

```bash
git submodule add https://github.com/willGuimont/mojo_raylib third_party/raylib_mojo
git submodule update --init --recursive
```

#### 2. Configure `pixi.toml` / `mojoproject.toml`

Ensure `channels` includes the Modular channel (`https://conda.modular.com/max`), and `max`, `mojo`, `cmake`, `ninja`, and `make` are included in your dependencies so Pixi can manage Mojo and build `libraylib`. Add tasks to build `raylib` and run your app with the required import (`-I`), library path (`-L`), runtime search path (`-rpath`), and linker (`-lraylib`) flags:

```toml
[workspace]
channels = ["conda-forge", "https://conda.modular.com/max"]
platforms = ["linux-64"]

[tasks]
build-raylib = "cmake -B third_party/raylib_mojo/build/raylib -S third_party/raylib_mojo/third_party/raylib -DBUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON && cmake --build third_party/raylib_mojo/build/raylib"
start = "mojo run -I third_party/raylib_mojo/src -Xlinker -Lthird_party/raylib_mojo/build/raylib/raylib -Xlinker -rpath -Xlinker third_party/raylib_mojo/build/raylib/raylib -Xlinker -lraylib main.mojo"

[dependencies]
max = ">=26.5.0"
mojo = ">=1.0.0"
cmake = "*"
ninja = "*"
make = "*"
```

#### 3. Build & Run

Build the `raylib` shared library and launch your application:

```bash
# Build raylib shared library
pixi run build-raylib

# Run your Mojo main program
pixi run start
```

## Examples

Run any of the included examples using Pixi tasks:

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

## Development & Automatic Binding Generation

`raylib-mojo` includes a pure Mojo automatic binding generator script (`scripts/generate_bindings.mojo`) that parses Raylib's C declarations from `raylib.h`, maps C types to Mojo types, and verifies each symbol dynamically against `libraylib.so`.

To regenerate the low-level C FFI wrappers into `src/raylib/c.mojo`:

```bash
# Build libraylib.so first if not built already
pixi run build-raylib

# Regenerate bindings
pixi run generate-bindings
```

## Contributing

Feel free to open an issue. If you'd like to contribute, please fork the repository and make
changes as you'd like. Pull requests are welcome.

If you want to request features or report bugs related to raylib directly (in contrast to this binding), please refer to the [author's project repo](https://github.com/raysan5/raylib).

## License

See [LICENSE](LICENSE.md) for details.

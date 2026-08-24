"""Raylib [physics/particles] example - Interactive Particle Assembly.

High-performance 2D physics particle simulation in Mojo.
1,200 particles simulate spring attraction to target shape positions, velocity
damping, and interactive mouse repulsion/attraction forces.
Controls:
  Mouse Left Drag: Repel/Scatter nearby particles
  SPACE: Switch target formation (Grid, Circle, Heart shape)
  R: Reset particle positions to random locations
"""

from std.math import sin, cos, sqrt
from std.collections import List
from raylib import (
    init_window,
    window_should_close,
    close_window,
    set_target_fps,
    begin_drawing,
    end_drawing,
    clear_background,
    draw_text,
    draw_fps,
    draw_circle_v,
    is_key_pressed,
    is_mouse_button_down,
    get_mouse_position,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    GOLD,
    LIME,
    SKYBLUE,
    PURPLE,
    MAROON,
    ORANGE,
    Color,
    Vector2,
    KEY_SPACE,
    KEY_R,
    MOUSE_BUTTON_LEFT,
)
import raylib.c as c

comptime SCREEN_W = 1000
comptime SCREEN_H = 600
comptime NUM_PARTICLES = 1200


struct Particle(ImplicitlyCopyable, TrivialRegisterPassable):
    var pos: Vector2
    var vel: Vector2
    var target: Vector2
    var color: Color
    var radius: Float32

    def __init__(out self):
        self.pos = Vector2()
        self.vel = Vector2()
        self.target = Vector2()
        self.color = Color()
        self.radius = 2.0


def generate_shape_targets(shape_type: Int, mut particles: List[Particle]):
    var center_x = Float32(SCREEN_W / 2)
    var center_y = Float32(SCREEN_H / 2)

    for i in range(NUM_PARTICLES):
        var t = Float32(i)
        var tx: Float32
        var ty: Float32

        if shape_type == 0:
            # Grid Pattern
            var cols: Int = 40
            var row = i / cols
            var col = i % cols
            tx = center_x - 300.0 + Float32(col * 15)
            ty = center_y - 225.0 + Float32(row * 15)
        elif shape_type == 1:
            # Concentric Circles
            var radius = Float32(100 + (i % 6) * 35)
            var angle = (t / Float32(NUM_PARTICLES / 6)) * 6.28318530718
            tx = center_x + cos(angle) * radius
            ty = center_y + sin(angle) * radius
        else:
            # Heart Shape
            var angle = (t / Float32(NUM_PARTICLES)) * 6.28318530718
            var scale: Float32 = 12.0
            tx = center_x + scale * 16.0 * sin(angle) * sin(angle) * sin(angle)
            ty = center_y - scale * (
                13.0 * cos(angle)
                - 5.0 * cos(2.0 * angle)
                - 2.0 * cos(3.0 * angle)
                - cos(4.0 * angle)
            )

        var p = particles[i]
        p.target = Vector2(tx, ty)
        particles[i] = p


def main():
    init_window(
        SCREEN_W, SCREEN_H, "raylib [particles] example - particle assembly"
    )
    set_target_fps(60)

    # Initialize Particles
    var particles = List[Particle]()
    var palette = List[Color]()
    palette.append(RED())
    palette.append(GOLD())
    palette.append(LIME())
    palette.append(SKYBLUE())
    palette.append(BLUE())
    palette.append(PURPLE())
    palette.append(ORANGE())
    palette.append(MAROON())

    for i in range(NUM_PARTICLES):
        var p = Particle()
        p.pos = Vector2(
            Float32(c.GetRandomValue(50, SCREEN_W - 50)),
            Float32(c.GetRandomValue(50, SCREEN_H - 50)),
        )
        p.vel = Vector2(
            Float32(c.GetRandomValue(-5, 5)), Float32(c.GetRandomValue(-5, 5))
        )
        p.color = palette[i % len(palette)]
        p.radius = Float32(c.GetRandomValue(2, 4))
        particles.append(p)

    var shape_type: Int = 0
    generate_shape_targets(shape_type, particles)

    while not window_should_close():
        # Input Controls
        if is_key_pressed(KEY_SPACE):
            shape_type = (shape_type + 1) % 3
            generate_shape_targets(shape_type, particles)

        if is_key_pressed(KEY_R):
            for i in range(NUM_PARTICLES):
                var p = particles[i]
                p.pos = Vector2(
                    Float32(c.GetRandomValue(50, SCREEN_W - 50)),
                    Float32(c.GetRandomValue(50, SCREEN_H - 50)),
                )
                particles[i] = p

        var mouse_pos = get_mouse_position()
        var mouse_down = is_mouse_button_down(MOUSE_BUTTON_LEFT)

        # Physics Simulation Loop
        var dt: Float32 = 0.016
        var spring_k: Float32 = 8.0
        var damping: Float32 = 0.88

        for i in range(NUM_PARTICLES):
            var p = particles[i]
            var px = p.pos.x
            var py = p.pos.y
            var vx = p.vel.x
            var vy = p.vel.y
            var tx = p.target.x
            var ty = p.target.y

            # Spring force towards target position
            var ax = (tx - px) * spring_k
            var ay = (ty - py) * spring_k

            # Interactive mouse repulsion
            if mouse_down:
                var dx = px - mouse_pos.x
                var dy = py - mouse_pos.y
                var dist_sq = dx * dx + dy * dy
                if dist_sq < 22500.0 and dist_sq > 0.0:  # 150px radius
                    var dist = sqrt(dist_sq)
                    var force = (150.0 - dist) * 15.0
                    ax += (dx / dist) * force
                    ay += (dy / dist) * force

            # Velocity integration
            vx = (vx + ax * dt) * damping
            vy = (vy + ay * dt) * damping
            px += vx
            py += vy

            p.pos = Vector2(px, py)
            p.vel = Vector2(vx, vy)
            particles[i] = p

        # Render Particles & UI
        begin_drawing()
        clear_background(RAYWHITE())

        # Render particles
        for i in range(NUM_PARTICLES):
            var p = particles[i]
            draw_circle_v(p.pos, p.radius, p.color)

        draw_text(
            "INTERACTIVE PARTICLE ASSEMBLY SIMULATION", 260, 30, 20, DARKGRAY()
        )
        draw_text(
            "SPACE: Switch Formation (Grid / Circles / Heart)",
            270,
            70,
            16,
            DARKGRAY(),
        )
        draw_text(
            "LEFT MOUSE DRAG: Repel particles with force",
            300,
            95,
            16,
            DARKGRAY(),
        )
        draw_text("R: Reset particle positions", 380, 120, 16, DARKGRAY())

        var shape_name = "Grid" if shape_type == 0 else (
            "Circles" if shape_type == 1 else "Heart"
        )
        draw_text(
            "Formation: "
            + shape_name
            + " ("
            + String(NUM_PARTICLES)
            + " Particles)",
            340,
            540,
            18,
            RED(),
        )

        draw_fps(10, 10)
        end_drawing()

    close_window()

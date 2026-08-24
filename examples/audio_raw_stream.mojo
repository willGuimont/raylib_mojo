"""Raylib [audio] example - Raw Audio Stream Synthesis.

Synthesizes a sine wave on the fly in Mojo and feeds audio PCM sample buffers
into a Raylib AudioStream.
Controls:
  Up/Down: Increase/Decrease frequency
  Left/Right: Pan Left/Right
"""

from std.math import sin
from std.collections import List
from raylib import (
    init_window,
    window_should_close,
    close_window,
    init_audio_device,
    close_audio_device,
    set_target_fps,
    begin_drawing,
    end_drawing,
    clear_background,
    draw_text,
    draw_line,
    draw_fps,
    is_key_down,
    RAYWHITE,
    DARKGRAY,
    RED,
    BLUE,
    LIGHTGRAY,
    KEY_UP,
    KEY_DOWN,
    KEY_LEFT,
    KEY_RIGHT,
)
import raylib.c as c

comptime SCREEN_W = 800
comptime SCREEN_H = 450
comptime SAMPLE_RATE = 44100
comptime BUFFER_SIZE = 512


def main():
    init_window(
        SCREEN_W, SCREEN_H, "raylib [audio] example - raw stream synthesis"
    )
    init_audio_device()
    set_target_fps(60)

    # Load audio stream (44100Hz, 16-bit, 1 channel mono)
    c.SetAudioStreamBufferSizeDefault(BUFFER_SIZE)
    var stream = c.LoadAudioStream(SAMPLE_RATE, 16, 1)
    c.PlayAudioStream(stream)

    var frequency: Float32 = 440.0
    var pan: Float32 = 0.5
    var sine_idx: Float32 = 0.0

    # Allocate buffer for 16-bit PCM audio samples
    var buffer = List[Int16]()
    for _ in range(BUFFER_SIZE):
        buffer.append(0)

    while not window_should_close():
        # Handle User Input
        if is_key_down(KEY_UP):
            frequency += 2.0
            if frequency > 2000.0:
                frequency = 2000.0
        if is_key_down(KEY_DOWN):
            frequency -= 2.0
            if frequency < 50.0:
                frequency = 50.0

        if is_key_down(KEY_LEFT):
            pan -= 0.02
            if pan < 0.0:
                pan = 0.0
            c.SetAudioStreamPan(stream, pan)
        if is_key_down(KEY_RIGHT):
            pan += 0.02
            if pan > 1.0:
                pan = 1.0
            c.SetAudioStreamPan(stream, pan)

        # Refill audio buffer when raylib asks for more samples
        if c.IsAudioStreamProcessed(stream):
            var incr = (frequency * 2.0 * 3.1415926535) / Float32(SAMPLE_RATE)
            for i in range(BUFFER_SIZE):
                var sample_val = sin(sine_idx) * 32000.0
                buffer[i] = Int16(sample_val)
                sine_idx += incr

            c.UpdateAudioStream(
                stream,
                buffer.unsafe_ptr().unsafe_bitcast[NoneType](),
                BUFFER_SIZE,
            )

        # Draw UI & Waveform Graph
        begin_drawing()
        clear_background(RAYWHITE())

        draw_text("SINE WAVE AUDIO STREAM SYNTHESIS", 180, 40, 20, DARKGRAY())
        draw_text(
            "Use UP/DOWN keys to change FREQUENCY", 200, 90, 18, DARKGRAY()
        )
        draw_text("Use LEFT/RIGHT keys to change PAN", 200, 120, 18, DARKGRAY())

        draw_text(
            "Frequency: " + String(Int(frequency)) + " Hz", 220, 170, 20, RED()
        )
        draw_text("Pan: " + String(Int(pan * 100)) + " %", 480, 170, 20, BLUE())

        # Render waveform preview graph
        draw_text("Audio Buffer Preview:", 100, 230, 18, DARKGRAY())
        draw_line(100, 320, 700, 320, LIGHTGRAY())
        for i in range(BUFFER_SIZE - 1):
            if i % 2 == 0:
                var x1 = Int32(
                    100 + Int(Float32(i) / Float32(BUFFER_SIZE) * 600.0)
                )
                var y1 = Int32(320 - Int(Float32(buffer[i]) / 32000.0 * 70.0))
                var x2 = Int32(
                    100 + Int(Float32(i + 1) / Float32(BUFFER_SIZE) * 600.0)
                )
                var y2 = Int32(
                    320 - Int(Float32(buffer[i + 1]) / 32000.0 * 70.0)
                )
                draw_line(x1, y1, x2, y2, RED())

        draw_fps(10, 10)
        end_drawing()

    c.UnloadAudioStream(stream)
    close_audio_device()
    close_window()

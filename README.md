# MI-VO

**MIDI-In, Voltage-Out** is a pair of Ableton Live Max instruments for controlling a Polaxis Talko 2 CV-controlled musical device from an Ableton Push.

The original goal was to use the Push's two stereo CV outputs as four separate CV outputs. This makes it possible to send gate information and three CV signals to the Talko 2. For example, the CV signals can control sound choice, speed, and pitch.

## How it works

MI-VO uses two Max instruments designed to be synchronized in Ableton Live. A single instrument can route only up to two audio signals, so the MIDI information is split across the pair:

- One instrument maps gate and pitch information from a set of MIDI signals to CV.
- The other maps MIDI pitch and velocity values to two additional CV inputs.

Together, the instruments provide the gate and CV signals needed for this control setup. The Talko 2 has more inputs than this setup can control, so not every input is available.

## Important: instrument gain

Turn the gain **fully up** on the instrument channels. The gain must be at maximum to produce the appropriate voltage.

## Devices

Both instruments are self-contained Max for Live devices in [devices/](devices/):

| Device | Outputs | Signals |
|--------|---------|---------|
| `talko_midi_gate_and_pitch.amxd` | Ext. Out 5/6 | Gate (left), pitch (right) |
| `talko_midi_pitch_and_velocity.amxd` | Ext. Out 7/8 | Pitch (left), velocity (right) |

## Setup

More setup information coming soon.

## Future

Future improvements include:

- UI elements
- Generalized CV control
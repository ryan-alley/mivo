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

The [src/](src/) folder holds `.maxpat` source versions of both devices, generated from the `.amxd` files.

## Pitch bend (planned)

Pitch bend automation is not implemented in the current devices. The planned design:

- A **Pitch Bend** dial, automatable in Live, is added to incoming MIDI pitch bend. The total is clipped to ±1.
- The clipped value maps to ±0.55 V, one octave of total travel, or ±6 semitones at 0.0917 V per semitone.
- Bend is added to the pitch CV before output scaling, so it would move the pitch whether or not a note is held.

## Velocity scale (planned)

Velocity scaling is not implemented in the current devices. The planned design:

- A **Velocity Scale** dial on the pitch/velocity device, automatable in Live, multiplies the held note velocity CV from 0% (0 V) to 100% (full velocity). The default is 100%, so the output would be unchanged until the dial is moved.
- It is applied before output scaling and does not change the note's pitch.

## Setup

The steps below describe the one layout tested so far: one MIDI track per instrument, controlling a Polaxis Talko 2. Other layouts are untested.

### 1. Enable the Push CV outputs

1. In Live's audio preferences, enable the two stereo outputs for the Push - label them as:
   - Push CV Output 1 - Tip
   - Push CV Output 1 - Ring
   - Push CV Output 2 - Tip
   - Push CV Output 2 - Ring
2. On the Push, select CV output.
3. The outputs then appear in Live by there aforementioned names, paired as stereo.

### 2. Add two MIDI tracks

1. Create two MIDI tracks.
2. Load `talko_midi_gate_and_pitch.amxd` on the first track and `talko_midi_pitch_and_velocity.amxd` on the second.
3. Set each track's audio output to its Push CV output pair:
   - Gate and pitch track: Push CV Output 1 (left channel = Tip, right channel = Ring)
   - Pitch and velocity track: Push CV Output 2 (left channel = Tip, right channel = Ring)
4. Keep the gain fully up, the fader at 0 dB, and no effects on either track.

### 3. Understand how the two tracks work together

The two devices split the work. The gate and pitch track sends the gate signal, along with pitch on the right channel. The pitch and velocity track provides two more CV values. Nothing needs to match exactly between the tracks, but both must receive MIDI notes for their CV outputs to update.

### 4. Check voltages before connecting

Measure each output with a multimeter before connecting the Talko 2. The devices' calibration has not yet been verified against the Talko 2, and the gate-high voltage of 5 V is assumed.

Note: the pitch CV is designed to read 0 V at C3 and 3.3 V at C7. See the Future section for planned documentation of the note-to-voltage mapping.

## Future

Planned improvements include:

- **Pitch bend automation:** tried an implementation but it was clunky and didn't work great.  There's a lot of behind-the-scenes mapping that goes on with the automation in Ableton that you have to take into account.
- **Velocity automation:** had this vaguely coded as well, but I think it would be better to use dedicated control channels in MIDI?
- **Talko 2 voltages:** document the Talko 2's gate and CV voltage specifications.
- **Push 3 outputs:** document the Push 3's CV output capabilities and the assumptions the instruments make.
- **Note-to-voltage mapping:** document how MIDI notes map to voltage under each setting. The current mapping is C3 to C7, linear from 0 V to 3.3 V.
- **TRS breakout setup:** add examples and diagrams for splitting tip and ring with a TRS-to-two-TS breakout cable.
- **Instrument UI:** build a user interface for both instruments so they are easier to use in Ableton Live.
- **General CV control:** generalize beyond the Talko 2 with more flexible signalling.
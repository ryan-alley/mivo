# MI-VO

**MIDI-In, Voltage-Out** is a pair of Ableton Live Max instruments for controlling a Polaxis Talko 2 CV-controlled musical device from an Ableton Push.

The original goal was to use the Push's two stereo CV outputs as four separate CV outputs. This makes it possible to send gate information and three CV signals to the Talko 2. For example, the CV signals can control sound choice, speed, and pitch.

## How it works

MI-VO uses two Max instruments designed to be synchronized in Ableton Live. A single instrument can route only up to two audio signals, so the MIDI information is split across the pair:

- One instrument maps gate and pitch information from a set of MIDI signals to CV.
- The other maps MIDI pitch and velocity values to two additional CV inputs.

Together, the instruments provide the gate and CV signals needed for this control setup. The Talko 2 has more inputs than this setup can control, so not every input is available.

## Important: instrument gain

Keep the track volume fader at **0 dB** (unity) on each instrument track. The devices' voltage scaling assumes 0 dB. Raising the fader above 0 dB raises the output above the intended voltage, and it may clip at the Push's 10 V limit (not tested).

## Devices

Both instruments are self-contained Max for Live devices in [devices/](devices/):

| Device | Outputs | Signals |
|--------|---------|---------|
| `talko_midi_gate_and_pitch.amxd` | Ext. Out 5/6 | Gate (left), pitch (right) |
| `talko_midi_pitch_and_velocity.amxd` | Ext. Out 7/8 | Pitch (left), velocity (right) |

The [src/](src/) folder holds `.maxpat` source versions of both devices, generated from the `.amxd` files.

## Talko 2 voltages

Source: Polaxis, [Talko 2 Eurorack](https://www.polaxis.be/product/talko-2-bricky-eurorack/) and [Talko 2 Bricky](https://www.polaxis.be/product/talko-2-bricky/) product pages. Both list the same CV and gate specifications. The [user manual](https://www.polaxis.be/talko-2-user-manual/) describes the jacks but gives no voltages.

| Input | Recommended | Limits |
|-------|-------------|--------|
| CV (Sound, Speed, Pitch, FX) | 0–3.3 V | Clipped above 3.3 V; tolerates up to +10 V |
| Gate In | 0–5 V | Accepts up to +10 V |

What this means for MI-VO:

- The pitch and velocity CVs top out at 3.3 V, the top of the Talko 2's CV range.
- Gate high is 5 V, the top of the recommended gate range.
- Polaxis says pitch CV "does not follow 1 V/octave". MI-VO's pitch CV is a voltage scale, not a musical scale on the Talko 2.
- By tweaking the instrument logic - this instrument could be extendable to other CV devices.

Not published by Polaxis: the gate high/low threshold, input impedance, and a clock or sync input. The Gate In is the only trigger input.

## Push 3 CV outputs

Sources: Ableton's [CV Tools on Push 3](https://help.ableton.com/hc/en-us/articles/21087935492636-CV-Tools-on-Push-3) and [CV Tools Setup and Routing Pages on Push 3](https://help.ableton.com/hc/en-us/articles/21089380218396-CV-Tools-Setup-and-Routing-Pages-on-Push-3-standalone) articles, and the [Push manual](https://www.ableton.com/en/push/manual/#pedals-cv-tab).

Official specifications:

- Two stereo Pedal/CV jacks. A TRS-to-dual-TS cable splits each jack into two CV outputs, four in total (Tip and Ring for each jack).
- Voltage range is 0–10 V, unipolar only. Resolution is 12 bits and bandwidth is DC–20 kHz.
- Pedal Jack 1 is Live audio channels 5–6, and Pedal Jack 2 is channels 7–8.
- Ableton's CV Instrument calibration sets polarity to Unipolar for these outputs.

What this means for MI-VO:

- The devices send to Ext. Out 5/6 and 7/8, which are the two Pedal/CV jacks.
- All MI-VO outputs are positive, so unipolar mode matches.
- The patches use 0–3.3 V of the 0–10 V range. At 12 bits, one step is about 2.4 mV, or roughly 1/37 of a semitone at 0.0917 V per semitone.
- Ableton does not publish how Live signal level maps to voltage. MI-VO assumes full scale is 10 V.

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
4. Keep the track volume fader at 0 dB and no effects on either track.

### 3. Understand how the two tracks work together

The two devices split the work. The gate and pitch track sends the gate signal, along with pitch on the right channel. The pitch and velocity track provides two more CV values. Nothing needs to match exactly between the tracks, but both must receive MIDI notes for their CV outputs to update.

### 4. Check voltages before connecting

Measure each output with a multimeter before connecting the Talko 2. The devices' calibration has not yet been verified against the Talko 2. The gate-high voltage of 5 V is within the Talko 2's recommended gate range, but it is still assumed.

Note: the pitch CV is designed to read 0 V at C3 and 3.3 V at C6. See the Future section for planned documentation of the note-to-voltage mapping.

## Future

Planned improvements include:

- **Note-to-voltage mapping:** document how MIDI notes map to voltage under each setting. The current mapping is C3 to C6, linear from 0 V to 3.3 V.
- **TRS breakout setup:** add examples and diagrams for splitting tip and ring with a TRS-to-two-TS breakout cable.
- **Instrument UI:** build a user interface for both instruments so they are easier to use in Ableton Live.
- **General CV control:** generalize beyond the Talko 2 with more flexible signalling and settings.
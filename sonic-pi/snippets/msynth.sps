#key: msynth
#point_line:4
#point_index:10
# --
live_loop :midi_synth do
  # use midi input from the keyboard for controlling a synth in Sonic Pi
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/1/note_on"
  synth :, note: note
end

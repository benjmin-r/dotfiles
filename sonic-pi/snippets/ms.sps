#key: ms
#point_line:3
#point_index:9
# --
live_loop :midi_synth do
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/1/note_on"
  synth :, note: note
end

#key: mp
#point_line:4
#point_index:25
# --
live_loop :midi_pads do
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/2/note_on"
  with_fx :slicer, mix: 0 do
    play_pad(note, velocity)
  end
end

live_loop :map_pads do
  map_pad :pad1, sample: :drum_heavy_kick
  map_pad :pad2, sample: :sn_dolf
  map_pad :pad3, sample: :drum_cymbal_closed
  map_pad :pad4, sample: :vinyl_scratch
  stop
end


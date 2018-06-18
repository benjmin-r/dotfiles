#key: min
#point_line:0
#point_index:0
# --
live_loop :midi_passthrough_on do
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/1/note_on"
  midi_note_on note, vel: velocity, channel: 1, port: 'usb_midi_interface'
end

live_loop :midi_passthrough_off do
  use_real_time
  note, velocity = sync "/midi/vmini_out/0/1/note_off"
  midi_note_off note, release_velocity: velocity, channel: 1, port: 'usb_midi_interface'
end

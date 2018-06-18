#key: mclock
#point_line:6
#point_index:0
# --
live_loop :midi_clock do
  bpm 80
  midi_clock_beat port: 'usb_midi_interface', channel: 1
  sleep 1
end


#key: mk
#point_line:6
#point_index:0
# --
live_loop :midi_knobs do
  use_real_time
  knob_num, value = sync "/midi/vmini_out/0/1/control_change"
  set translate_knob(knob_num), value
end


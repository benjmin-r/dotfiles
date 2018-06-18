load_snippets "~/.sonic-pi/snippets", quiet: true

def my_samples
  '~/data/music-samples'
end

# helper functions for reading values from the knobs of my midi keyboard
def translate_knob(knob_cc)
  case knob_cc
  when 14 then :knob1
  when 15 then :knob2
  when 16 then :knob3
  when 17 then :knob4
  end
end

def kn1(max_value: 10)
  (get(:knob1) || 1) * max_value / 127
end

def kn2(max_value: 10)
  (get(:knob2) || 1) * max_value / 127
end

def kn3(max_value: 10)
  (get(:knob3) || 1) * max_value / 127
end

def kn4(max_value: 10)
  (get(:knob4) || 1) * max_value / 127
end

# helper for setting bpm that is read from & written to a shared variable
def bpm(value)
  if value.nil?
    use_bpm get(:bpm) if get(:bpm)
  elsif value != get(:bpm)
    set :bpm, value
    use_bpm value
  end
end


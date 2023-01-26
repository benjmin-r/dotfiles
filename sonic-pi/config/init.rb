load_snippets "~/.sonic-pi/snippets", quiet: true

def snippets
  '~/data/music/music-samples_all/snippets'
end

def claps
  '~/data/music/music-samples_all/claps'
end

def esgibt
  '~/data/music/music-samples_all/es-gibt-melodien'
end

def salt_kicks
  '~/data/music/music-samples_all/Accurate Beats - Salt/Clean/Kicks Clean'
end

def salt_melodic
  '~/data/music/music-samples_all/Accurate Beats - Salt/Clean/Melodic Clean'
end

def salt_ohh
  '~/data/music/music-samples_all/Accurate Beats - Salt/Clean/OHH Clean'
end

def salt_chh
  '~/data/music/music-samples_all/Accurate Beats - Salt/Clean/CHH Clean'
end

def salt_snare
  '~/data/music/music-samples_all/Accurate Beats - Salt/Clean/Snares Clean'
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

def kn1(max: 10)
  ((get(:knob1) || 1) * max / 127.to_f).round(2)
end

def kn2(max: 10)
  ((get(:knob2) || 1) * max / 127.to_f).round(2)
end

def kn3(max: 10)
  ((get(:knob3) || 1) * max / 127.to_f).round(2)
end

def kn4(max: 10)
  ((get(:knob4) || 1) * max / 127.to_f).round(2)
end

def conv(value, max: 10)
  ((value) * max / 127.to_f).round(2)
end


# helper functions for mapping pad (or really any other key) from a midi keyboard
# to triggering a sample ... needs `live_loop :midi_pads` and `live_loop :map_pads`
# for fully functioning
def translate_pad(pad_index)
  case pad_index
  when 36 then :pad1
  when 38 then :pad2
  when 40 then :pad3
  when 41 then :pad4
  end
end

def map_pad(pad, sample:, dir: nil)
  set pad, [dir, sample]
end

def play_pad(pad_index, velocity)
  dir, smpl = get translate_pad(pad_index)
  sample dir, smpl, amp: (velocity*5)/127
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

# allows
# ```
# play 40
# sleep 1
# play 42
# sleep 2
# play 44
# sleep 3
# play 46
# sleep 1
# ```
# to be expressed as `play_timed [40, 42, 44, 46], [1, 2, 3], amp: 2`
define :play_timed do |notes, times, **args|
  ts = times.ring
  notes.each_with_index do |note, i|
    play note, **args
    sleep ts[i]
  end
end

# following is only for having simple autocomplete in vim
vim_synth_names = (ring :beep, :blade, :bnoise, :chipbass, :chiplead, :chipnoise, :cnoise, :dark_ambience, :dpulse, :dsaw, :dtri, :dull_bell, :fm, :gnoise, :growl, :hollow, :hoover, :mod_beep, :mod_dsaw, :mod_fm, :mod_pulse, :mod_saw, :mod_sine, :mod_tri, :noise, :piano, :pluck, :pnoise, :pretty_bell, :prophet, :pulse, :saw, :sine, :sound_in, :sound_in_stereo, :square, :subpulse, :supersaw, :tb303, :tech_saws, :tri, :zawa)


#key: sam1
#point_line:0
#point_index:0
# --
live_loop :sam do
  use_random_seed 5001
  notes = (scale :e1, :minor_pentatonic, num_octaves: 3).shuffle

  with_fx :lpf, cutoff: 80 do
    with_fx :reverb, room: 0, amp: 2 do
      with_fx :tanh, krunch: 30, amp: 2 do
        n = synth :dsaw, cutoff: 130, release: 8, note: notes.tick, cutoff_slide: 1.5
        control n, cutoff: 70
        32.times do
          sleep 0.125
          control n, note: notes.choose
        end
      end
    end
  end
end

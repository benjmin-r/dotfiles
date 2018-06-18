#key: maudio
#point_line:7
#point_index:0
# --
live_loop :audio do
  with_fx :reverb, room: 0.5 do
    live_audio :from_mixer, input: 1, stereo: true
  end
  sleep 1
end


#key: bass
#point_line:0
#point_index:0
# --
live_loop :bass do
  scale(:e1, :minor).shuffle.each do |note|
    play note, release: 4
    sleep 2
  end
end

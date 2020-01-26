#key: melodie
#point_line:0
#point_index:0
# --
live_loop :melodie, sync: :bass do
  scale(:e, :minor).shuffle.each do |note|
    play note, amp: 2
    sleep 0.25
  end
end

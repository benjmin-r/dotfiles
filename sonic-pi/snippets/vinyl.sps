#key: vinyl
#point_line:0
#point_index:0
# --
def sliced_scratch
  with_fx :slicer, mix: rrand(0.5, 1) do
    multi = rrand(1.0, 1.9)
    sample :vinyl_scratch, rate: multi
    sleep sample_duration(:vinyl_scratch) * multi
  end
end

def sliced_backspin
  with_fx :slicer, mix: rrand(0.5, 1) do
    multi = rrand(0.8, 1.2)
    sample :vinyl_backspin, rate: multi, finish: 0.7
    sleep sample_duration(:vinyl_backspin) * multi * 0.7
  end
end

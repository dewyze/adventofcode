File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.to_integer/1)
|> Stream.cycle()
|> Enum.reduce_while({MapSet.new(), 0}, fn x, {freq, acc} ->
  if MapSet.member?(freq, acc + x) do
    {:halt, IO.puts(acc + x)}
  else
    sum = acc + x
    {:cont, {MapSet.put(freq, sum), sum}}
  end
end)

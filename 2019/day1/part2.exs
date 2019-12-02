File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.to_integer/1)
|> Enum.reduce(0, fn x, acc ->
  Enum.reduce_while(
  x + acc
  div(x, 3) - 2 + acc
end)
|> IO.puts()

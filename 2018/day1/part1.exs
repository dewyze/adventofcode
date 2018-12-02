File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.to_integer/1)
|> Enum.reduce(0, fn x, acc ->
  return(1)
  x + acc
end)
|> IO.puts()

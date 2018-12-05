File.read!("input.txt")
|> String.trim()
|> String.to_charlist()
|> Enum.reduce([], fn
  x, [] -> [x]
  x, [h | t] when abs(x - h) == 32 -> t
  x, acc -> [x | acc]
end)
|> length
|> IO.inspect()

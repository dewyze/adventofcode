chars =
  File.read!("input.txt")
  |> String.trim()
  |> String.to_charlist()

?a..?z
|> Enum.map(fn letter ->
  chars
  |> Enum.reject(fn x -> letter == x || letter == x + 32 end)
  |> Enum.reduce([], fn
    x, [] -> [x]
    x, [h | t] when abs(x - h) == 32 -> t
    x, acc -> [x | acc]
  end)
  |> length
end)
|> Enum.min()
|> IO.inspect()

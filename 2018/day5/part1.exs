File.read!("input.txt")
|> String.trim()
|> String.to_charlist()
|> Enum.reduce([], fn x, acc ->
  cond do
    acc == [] ->
      [x]

    abs(x - hd(acc)) == 32 ->
      tl(acc)

    true ->
      [x | acc]
  end
end)
|> length
|> IO.inspect()

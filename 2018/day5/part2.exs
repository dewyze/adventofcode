chars =
  File.read!("input.txt")
  |> String.trim()
  |> String.to_charlist()

?a..?z
|> Enum.map(fn letter ->
  chars
  |> Enum.reject(fn x -> letter == x || letter == x + 32 end)
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
end)
|> Enum.min()
|> IO.inspect()

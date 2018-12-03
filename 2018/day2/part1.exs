File.stream!("input.txt")
|> Stream.map(&String.trim/1)
|> Stream.map(&String.graphemes/1)
|> Enum.reduce({0, 0}, fn line, {acc2, acc3} ->
  counts =
    Enum.reduce(line, %{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
    |> Map.values()

  acc2 = if Enum.member?(counts, 2), do: acc2 + 1, else: acc2
  acc3 = if Enum.member?(counts, 3), do: acc3 + 1, else: acc3
  {acc2, acc3}
end)
|> (fn {twos, threes} -> IO.inspect(twos * threes) end).()

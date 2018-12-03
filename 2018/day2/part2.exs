lines =
  File.stream!("input.txt")
  |> Stream.map(&String.trim/1)
  |> Stream.map(&String.graphemes/1)

Enum.map(lines, fn id1 ->
  Enum.map(lines, fn id2 ->
    result = Enum.zip(id1, id2) |> Enum.map(fn {x, y} -> x == y end)

    if Enum.count(result, fn x -> x == false end) == 1 do
      idx = Enum.find_index(result, fn x -> x == false end)

      IO.inspect(List.delete_at(id1, idx) |> Enum.join())
      exit(:shutdown)
    end
  end)
end)

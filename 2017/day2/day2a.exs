File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(fn(x) -> String.split(x, " ", trim: true) end)
|> Enum.map(fn(x) -> Enum.map(x, &String.to_integer/1) end)
|> Enum.map(&Enum.min_max/1)
|> Enum.map(&Tuple.to_list/1)
|> Enum.map(fn([x,y]) -> abs((x - y)) end)
|> Enum.sum
|> IO.inspect

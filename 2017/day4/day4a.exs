File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(fn(x) -> String.split(x, " ", trim: true) end)
|> Enum.filter(fn(x) -> Enum.count(x) == Enum.count(Enum.dedup(Enum.sort(x))) end)
|> Enum.count
|> IO.inspect

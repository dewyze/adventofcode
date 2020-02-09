nums = File.read!("input.txt")
|> String.trim
|> String.graphemes
|> Enum.map(&String.to_integer/1)

Enum.chunk_every(nums ++ Enum.take(nums, 1), 2, 1, discard: true)
|> Enum.reduce(0, fn(pair, acc) ->
  if Enum.count(Enum.uniq(pair)) == 1 do
    acc + hd(pair)
  else
    acc
  end
end)
|> IO.inspect

# Improvements
# -------
# Enum.concat can be used instead of '++ Enum.take'
# It would be easier to filter out the non matching pairs and then just grab head and sum

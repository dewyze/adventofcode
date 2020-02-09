nums = File.read!("input.txt")
|> String.trim
|> String.graphemes
|> Enum.map(&String.to_integer/1)

{first, second} = Enum.split(nums, div(Enum.count(nums),2))

Enum.zip(first, second)
|> Enum.filter(fn{x,y} -> x == y end)
|> Enum.map(fn{x,_} -> x * 2 end)
|> Enum.sum
|> IO.inspect

# Improvements
# -------
# There is a `match` function which can pattern match which would make 9 much simpler
#   => Enum.filter(&match?({x, x}, &1))
# There is an `elem` function for grabbing an element out of a tuple for line 10
#   => Enum.map(&elem(&1, 0))

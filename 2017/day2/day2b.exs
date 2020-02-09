defmodule Permutate do
  def result(list) do
    Enum.reduce_while(list, 0, fn(x, acc) ->
      if acc > 0 do
        {:halt, acc}
      else
        {:cont, find_factors(x, list)}
      end
    end)
  end

  def find_factors(x, list) do
    Enum.reduce_while(list, 0, fn(y, acc) ->
      if x != y && rem(x,y) == 0 do
        {:halt, acc + div(x,y)}
      else
        {:cont, acc}
      end
    end)
  end
end

File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(fn(x) -> String.split(x, " ", trim: true) end)
|> Enum.map(fn(x) -> Enum.map(x, &String.to_integer/1) end)
|> Enum.map(&Permutate.result/1)
|> Enum.sum
|> IO.inspect(charlists: :as_lists)


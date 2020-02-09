defmodule Dedup do
  def dedup(list) do
    Enum.map(list, &String.graphemes/1)
    |> Enum.map(&Enum.sort/1)
    |> Enum.sort
    |> Enum.dedup
  end
end

File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(&String.split(&1, " "))
|> Enum.filter(&(Enum.count(&1) == Enum.count(Dedup.dedup(&1))))
|> Enum.count
|> IO.inspect(charlists: :as_lists)

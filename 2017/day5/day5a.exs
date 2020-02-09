defmodule Day5 do
  def move(list, index, steps) do
    if index < Enum.count(list) do
      jump = Enum.at(list, index)
      new = List.update_at(list, index, &(&1 + 1))
      Day5.move(new, index + jump, steps + 1)
    else
      IO.inspect steps  
    end
  end
end

File.read!("input.txt")
|> String.trim
|> String.split("\n")
|> Enum.map(&String.to_integer/1)
|> Enum.to_list
|> Day5.move(0, 0)


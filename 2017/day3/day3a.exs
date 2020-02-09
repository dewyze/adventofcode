defmodule Day3 do
  def solve(num) do
    next_sqrt = Float.ceil(:math.sqrt(num)) |> round
    side_length = if (rem(next_sqrt,2) != 0), do: next_sqrt, else: next_sqrt + 1
    next_square = :math.pow(side_length, 2) |> round
    mid = div(side_length, 2)
    dist_from_mid = abs(rem((next_square - num), side_length - 1) - mid)
    IO.inspect(dist_from_mid + mid)
  end
end

require 'pry'
inputs = File.readlines("input.txt")
coords = inputs.map{|i| i.chomp.split(", ").map(&:to_i)}
((min_x, _), (max_x, _)) = coords.minmax_by{|(x, y)| x}
((_, min_y), (_, max_y)) = coords.minmax_by{|(x, y)| y}

length = max_x - min_x + 1
height = max_y - min_y + 1

grid = Array.new(height){Array.new(length) { 1 }}
coords.each_with_index do |(x, y), label|
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      distance = (x - (min_x + j)).abs + (y - (min_y + i)).abs
      grid[i][j] += distance
    end
  end
end

result = grid.reduce(0) do |acc, row|
  row.each do |cell|
    acc += 1 if cell < 10000
  end
  acc
end
puts result

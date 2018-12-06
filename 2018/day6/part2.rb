inputs = File.readlines("input.txt")
coords = inputs.map{|i| i.chomp.split(", ").map(&:to_i)}
xs = coords.map{|(x, y)| x}
ys = coords.map{|(x, y)| y}
min_x = xs.min
max_x = xs.max
min_y = ys.min
max_y = ys.max

length = max_x - min_x + 1
height = max_y - min_y + 1

grid = Array.new(height){Array.new(length) { {} }}
coords.each_with_index do |(x, y), label|
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      distance = (x - (min_x + j)).abs + (y - (min_y + i)).abs
      if cell[:total].nil?
        cell[:total] = distance
      else
        cell[:total] += distance
      end
    end
  end
end

count = 0
grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    count +=1 if cell[:total] < 10000
  end
end
puts count

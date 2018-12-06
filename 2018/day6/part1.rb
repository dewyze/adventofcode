require 'pry'

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
      distance = (x - min_x + j) + (y - min_y + i)
      if cell[:length].nil? || distance < cell[:length]
        cell[:length] = distance
        cell[:labels] = [label]
      elsif distance == cell[:length]
        cell[:labels] << [label]
      end
    end
  end
end

counts = {}
grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cell[:labels].length == 1
      label = cell[:labels].first
      if counts[label].nil?
        counts[label] = 1
      else
        counts[label] += 1
      end
    end
  end
end
puts counts.inspect

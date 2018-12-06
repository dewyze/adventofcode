inputs = File.readlines("input.txt")
coords = inputs.map{|i| i.chomp.split(", ").map(&:to_i)}
((min_x, _), (max_x, _)) = coords.minmax_by{|(x, y)| x}
((_, min_y), (_, max_y)) = coords.minmax_by{|(x, y)| y}

length = max_x - min_x + 1
height = max_y - min_y + 1

grid = Array.new(height){Array.new(length) { {} }}
coords.each_with_index do |(x, y), label|
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      distance = (x - (min_x + j)).abs + (y - (min_y + i)).abs
      if cell[:length].nil? || distance < cell[:length]
        cell[:length] = distance
        cell[:labels] = [label]
      elsif distance == cell[:length]
        cell[:labels] << label
      end
    end
  end
end

# counts = Hash.new { |hash, key| hash[key] = 0 }
result = grid.reduce({}) do |acc, row|
  row.each do |cell|
    if cell[:labels].length == 1
      label = cell[:labels].first
      acc[label] ||= 0
      acc[label] += 1
    end
  end
  acc
end
puts result.max_by{|k,v| v}

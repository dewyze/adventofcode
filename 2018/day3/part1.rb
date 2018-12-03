input = File.readlines("input.txt")

squares = Array.new(1050){Array.new(1050){ [] }}

input.each do |cmd|
  cmds = cmd.split(" ")
  id = cmds[0]
  x,y = cmds[2].chomp(":").split(",").map(&:to_i)
  w,h = cmds[3].split("x").map(&:to_i)
  (0...w).each do |i|
    (0...h).each do |j|
      squares[x + i][y + j] << id
    end
  end
end

total = 0

squares.each do |row|
  row.each do |cell|
    total += 1 if cell.length > 1
  end
end

puts total

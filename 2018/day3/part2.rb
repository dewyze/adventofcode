input = File.readlines("input.txt")

squares = Array.new(1050){Array.new(1050){ [] }}
ids = []
not_possible = []

input.each do |cmd|
  cmds = cmd.split(" ")
  id = cmds[0]
  ids << id
  x,y = cmds[2].chomp(":").split(",").map(&:to_i)
  w,h = cmds[3].split("x").map(&:to_i)
  (0...w).each do |i|
    (0...h).each do |j|
      squares[x + i][y + j] << id
      squares[x+i][y+j].each {|x| not_possible << x} if squares[x+i][y+j].length > 1
    end
  end
end

puts ids.sort - not_possible.uniq.sort

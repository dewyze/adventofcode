lines = File.read("input.txt").split("\n").map(&:to_i)
index, steps, length = 0, 0, lines.length

while index < lines.length
  jump = lines[index]
  if jump > 2
    lines[index] -= 1
  else
    lines[index] += 1
  end
  index += jump
  steps += 1
end

puts steps

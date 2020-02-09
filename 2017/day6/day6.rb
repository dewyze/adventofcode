blocks = File.read("input.txt").chomp.split(" ").map(&:to_i)
seen = []

while !seen.include?(blocks)
  seen.push(blocks.dup)
  i = blocks.index(blocks.max)
  val = blocks[i]
  blocks[i] = 0
  val.times do
    unless (i += 1) < blocks.length
      i = 0
    end
    blocks[i] += 1
  end
end

puts seen.count # part 1
puts seen.count - seen.index(blocks) # part 2

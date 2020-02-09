sum = 0
nums = File.read("input.txt").chomp.chars.map(&:to_i)

halves = nums.each_slice(nums.length / 2).to_a
pairs = halves[0].zip(halves[1])
sum = pairs.reduce(0) do |acc, pair|
  acc += pair[0] == pair[1] ? pair[0] * 2 : 0
end
puts sum

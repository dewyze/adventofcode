sum = 0
nums = File.read("input.txt").chomp.chars.map(&:to_i)
nums.push(nums.first)
nums.each_cons(2) do |pair|
  sum+= pair.first if pair[0] == pair[1]
end

puts sum

nums = File.readlines("input.txt").map(&:to_i)
freq = {}
total = 0
nums.cycle do |num|
  total = num + total
  if freq.key?(total)
    puts total
    break
  else
    freq[total] = true
  end
end


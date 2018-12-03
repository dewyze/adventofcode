lines = File.readlines("input.txt")

puts (lines.reduce([0,0]) do |acc, line|
  counts = line.chars.each_with_object(Hash.new(0)) {|char, a| a[char] += 0 }
  acc[0] += 1 if counts.value?(2)
  acc[1] += 1 if counts.value?(3)
  acc
end.reduce(:*))

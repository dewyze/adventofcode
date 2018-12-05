input = File.read("input.txt").chomp.chars

result = input.reduce("") do |acc, x|
  last = acc[-1] || ""
  if last.downcase == x.downcase && (last.ord - x.ord).abs == 32
    acc[0...-1]
  else
    acc + x
  end
end

puts result.length

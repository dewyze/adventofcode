lines = File.readlines("input.txt")

twos = 0
threes = 0

lines.map do |line|
  two = false
  three = false

  chars = line.chomp.chars
  chars.each do |c|
    if chars.count(c) == 2 && !two
      twos += 1
      two = true
    end
    if chars.count(c) == 3 && !three
      threes += 1
      three = true
    end
  end
end

puts twos * threes

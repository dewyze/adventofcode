input = File.read("input.txt").chomp.chars

result = ('a'..'z').map do |letter|
  new_input = input.reject {|c| c.downcase == letter}

  result = new_input.reduce("") do |acc, x|
    last = acc[-1] || ""
    if last.downcase == x.downcase && (last.ord - x.ord).abs == 32
      acc[0...-1]
    else
      acc + x
    end
  end
  result.length
end
puts result.min

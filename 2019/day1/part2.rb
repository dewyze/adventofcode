def total(num)
  val = (num.to_i / 3) - 2

  return 0 if val <= 0
  val + total(val)
end

puts File.readlines("input.txt").map{|x| total(x)}.reduce(0, :+)

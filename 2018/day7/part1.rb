input = File.readlines("input.txt")

letters = []
prereqs = {}
input.each do |line|
  words = line.split(" ")
  prereq = words[1]
  letter = words[7]
  letters << prereq
  prereqs[letter] ||= []
  prereqs[letter] << prereq
end

available = letters.uniq.select do |l|
  !prereqs.key?(l)
end.sort

done = []
while !available.empty? do
  letter = available.shift
  next if done.include?(letter)
  done << letter if prereqs.none? {|p| p.include?(letter)}
  prereqs.each do |k,v|
    if (done | v) == done
      prereqs.delete(k)
      available << k
    end
  end
  available.sort!.uniq!
end
puts done.join("")

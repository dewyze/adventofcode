input = File.readlines("input.txt")

letters = []
prereqs = {}
input.each do |line|
  words = line.split(" ")
  prereq = words[1]
  letter = words[7]
  letters << prereq
  letters << letter
  prereqs[letter] ||= []
  prereqs[letter] << prereq
end

letters = letters.uniq

parents = letters.select do |l|
  !prereqs.key?(l)
end

available = parents.sort
met = []
while !available.empty? do
  letter = available.shift
  next if met.include?(letter)
  met << letter if prereqs.none? {|p| p.include?(letter)}
  prereqs.each do |k,v|
    if (met | v) == met
      prereqs.delete(k)
      available << k
    end
  end
  available.sort!.uniq!
end
puts met.join("")

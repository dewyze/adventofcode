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

available = letters.uniq.select do |l|
  !prereqs.key?(l)
end.sort

done = []
worker1 = {letter: nil, ready_in: 0}
worker2 = {letter: nil, ready_in: 0}
worker3 = {letter: nil, ready_in: 0}
worker4 = {letter: nil, ready_in: 0}
worker5 = {letter: nil, ready_in: 0}
workers = [worker1, worker2, worker3, worker4, worker5]
time = 0
while (!prereqs.empty? || workers.any?{|w| w[:ready_in] > 1}) do
  workers.each do |w|
    if w[:ready_in] == 1
      done << w[:letter] if prereqs.none? {|p| p.include?(w[:letter])}
      w[:letter] = nil
      w[:ready_in] = 0
    elsif w[:ready_in] > 1
      w[:ready_in] -= 1
    end
  end
  prereqs.each do |k,v|
    if (done | v) == done
      prereqs.delete(k)
      available << k
    end
  end
  available_workers = workers.select{|w| w[:ready_in] == 0}
  available_workers.each do |w|
    if !available.empty?
      letter = available.shift
      w[:letter] = letter
      w[:ready_in] = 60 + letter.ord - 64
    end
  end
  available.sort!.uniq!
  time += 1
end
puts time

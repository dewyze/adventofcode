nodes = File.read("input.txt").chomp.split(" ").map(&:to_i)

def checksum(sum, nodes)
  if nodes.nil?
    sum
  elsif nodes[0] == 0
    meta_size = nodes[1]
    sum = sum + (nodes[2]...nodes[2 + meta_size]).sum
    [sum, nodes[3..-1]]
  else
    children = nodes[0]
    meta_size = nodes[1]
    rem = nodes[2..-1]
    children.to_i.times.each do |c|
      (s, r) = checksum(sum, rem)
      sum = s
      rem = r
    end
    sum += (nodes[2]...nodes[2 + meta_size]).sum
  end
end

puts checksum(0, nodes).inspect

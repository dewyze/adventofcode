lines = File.read("input.txt").split("\n")
tree = {}
lines.each do |line|
  parts = line.split("->")
  name = parts[0].split(" ")[0]
  weight = parts[0].
  children = parts[1].split(",").map(&:strip) if parts[1]
  tree[name] = children
end

keys = tree.keys
vals = tree.values.flatten

puts keys - vals


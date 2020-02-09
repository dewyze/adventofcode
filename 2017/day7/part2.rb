lines = File.read("input.txt").split("\n")
tree = {}
lines.each do |line|
  parts = line.split("->")
  name = parts[0].split(" ")[0]
  weight = parts[0].split(" ")[1].tr("()","").to_i
  children = parts[1].split(",").map(&:strip) if parts[1]
  tree[name] = {weight: weight, children: children}
end

keys = tree.keys
vals = tree.values.map{|x| x[:children]}.flatten

leader = (keys - vals).first

weights = {}

def build_weights(name, tree, weights)
  weights[name] = tree[name][:weight] + children_weight(name, tree, weights)
end

def children_weight(name, tree, weights)
  return 0 unless tree[name][:children]
  tree[name][:children].reduce(0) do |acc, child|
    acc += build_weights(child, tree, weights)
  end
end

def find_outlier(name, tree, weights)
  if tree[name][:children]
    sibling_weights = Hash.new([])
    tree[name][:children].each do |child|
      sibling_weights[tree[child][:weight]] << child
    end

    if culprit = sibling_weights[1]
    else
    end
  else
  end
end

build_weights(leader, tree, weights)

find_outlier(leader, tree, weights)

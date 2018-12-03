ids = File.readlines("input.txt").map(&:chomp).map(&:chars)

ids.each_with_index do |id1, i|
  ids[(i+1)..-1].each do |id2|
    result = id1.zip(id2).map {|l| l.uniq.length == 1}
    if result.count(false) == 1
      puts id1.reduce("", :+)
      abort
    end
  end
end

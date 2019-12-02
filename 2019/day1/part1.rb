puts File.readlines("input.txt").map{|x| ( x.to_i / 3 ) - 2}.reduce(0, :+)

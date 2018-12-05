lines = File.readlines("input.txt").sort

guards = {}
guard = nil
asleep = nil

lines.each do |cmd|
  cmds = cmd.split("]")
  time = cmds[0].split(" ")[1].split(":")
  minute = time[1].to_i
  actions = cmds[1].lstrip.split(" ")
  case actions[0]
  when "Guard"
    guard = actions[1][1..-1]
    guards[guard] ||= []
  when "falls"
    asleep = minute
  when "wakes"
    (asleep...minute).each do |m|
      guards[guard] << m
    end
  end
end

id, minutes = guards.max_by{|k,v| v.length}
minute = minutes.max_by{|x| minutes.count(x)}
puts id.to_i * minute

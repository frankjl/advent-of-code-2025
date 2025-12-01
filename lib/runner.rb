require_relative "dial"
dial = Dial.new

File.readlines("inputs/day01.txt").each do |line|
  puts "Spinning #{line.strip} #{dial.counter} -> #{dial.password}"
  dial.spin(line.strip)
end

puts "Final password is #{dial.password}"

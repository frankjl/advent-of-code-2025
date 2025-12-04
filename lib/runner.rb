require_relative "dial"
dial = Dial.new

File.readlines("inputs/day01.txt").each do |line|
  # puts "Spinning #{line.strip} #{dial.counter} -> #{dial.password}"
  dial.spin(line.strip)
end

puts "Final password is #{dial.password}"

require_relative "id_range"
sum = IdRange.parse(File.read("inputs/day02.txt"))

puts "Sum of invalid IDs: #{sum}"

require_relative "battery_bank"

sum = File.readlines("inputs/day03.txt").sum do |line|
  bank = BatteryBank.new(line.strip.chars.map(&:to_i))
  largest = bank.find_largest_joltage(12)
  # puts "Largest joltage battery in #{line.strip} is #{largest}"
  largest
end

puts "Sum of largest joltage batteries: #{sum}"

require_relative "grid"
grid_input = File.read("inputs/day04.txt")
grid = Grid.new(grid_input)

total = 0

loop do
  all_acceptable = grid.get_all_accessible(1)
  total += all_acceptable.size

  all_acceptable.each do |coordinate|
    (x, y) = coordinate
    grid.mark_accessible(x, y)
  end
  puts "Marked #{all_acceptable.size} accessible cells, total so far: #{total}"
  break if all_acceptable.size == 0
end

puts "Total accessible cells in grid: #{total}"

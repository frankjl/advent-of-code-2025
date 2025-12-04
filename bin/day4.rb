#!/usr/bin/env ruby
require_relative "../lib/grid"
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

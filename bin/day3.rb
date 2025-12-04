#!/usr/bin/env ruby
require_relative "../lib/battery_bank"

sum = File.readlines("inputs/day03.txt").sum do |line|
  bank = BatteryBank.new(line.strip.chars.map(&:to_i))
  largest = bank.find_largest_joltage(12)
  # puts "Largest joltage battery in #{line.strip} is #{largest}"
  largest
end

puts "Sum of largest joltage batteries: #{sum}"

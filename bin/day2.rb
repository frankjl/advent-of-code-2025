#!/usr/bin/env ruby
require_relative "../lib/id_range"

input = File.read("inputs/day02.txt")
sum = input.strip.split(",").sum do |range|
  (start, stop) = range.split("-").map(&:to_i)
  IdRange.new(start, stop).find_invalid.sum
end

puts "Sum of invalid IDs: #{sum}"

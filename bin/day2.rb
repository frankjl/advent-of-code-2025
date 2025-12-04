#!/usr/bin/env ruby
require_relative "../lib/id_range"
sum = IdRange.parse(File.read("inputs/day02.txt"))

puts "Sum of invalid IDs: #{sum}"

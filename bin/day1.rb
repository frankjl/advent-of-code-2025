#!/usr/bin/env ruby
require_relative "../lib/dial"
dial = Dial.new

File.readlines("inputs/day01.txt").each do |line|
  # puts "Spinning #{line.strip}"
  dial.spin(line.strip)
end

puts "Final password is #{dial.password}"

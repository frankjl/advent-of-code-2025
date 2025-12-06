#!/usr/bin/env ruby
require_relative "../lib/calculator"

input = File.read("inputs/day06.txt")

calculator = Calculator.new(input)

puts "Value is: #{calculator.value.sum}"
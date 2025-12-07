#!/usr/bin/env ruby
require_relative "../lib/tachyon_manifold"

input = File.read("inputs/day07.txt")

manifold = TachyonManifold.new(input)

puts "Split count is: #{manifold.count_splits}"

puts "Timeline count is: #{manifold.count_all_possible_timelines}"
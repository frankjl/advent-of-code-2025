#!/usr/bin/env ruby
require_relative "../lib/tachyon_manifold"

input = File.read("inputs/day07.txt")

manifold = TachyonManifold.new(input)

puts "Value is: #{manifold.split_count}"
#!/usr/bin/env ruby
require_relative "../lib/junction_box"

input = File.read("inputs/day08.txt")
boxes = input.lines.map do |line|
  x, y, z = line.strip.split(",").map(&:to_i)
  JunctionBox.new(x, y, z)
end

connections = JunctionBox.find_closest(boxes)

connections.take(1000).each do |connection|
  puts "Connection(box1 = (#{connection.box1}, box2 = (#{connection.box2}, distance #{'%.2f' % connection.distance})"
  connection.connect
end

puts "Total circuits: #{boxes.map(&:circuit).uniq.size}"

circuits = boxes.map(&:circuit).uniq
circuits.sort_by(&:size).reverse.take(3).reduce(1) { |prod, circuit| prod * circuit.size }.tap do |product|
  puts "Product of sizes of the three largest circuits: #{product}"
end

while boxes.map(&:circuit).uniq.size > 2
  # Find the next closest connection that is not already connected
  connections.reject do |connection|
    connection.already_connected?
  end.sort_by(&:distance).first.tap do |connection|
    puts "Connection(box1 = (#{connection.box1}, box2 = (#{connection.box2}, distance #{'%.2f' % connection.distance})"
    connection.connect
  end
end

connections.reject do |connection|
  connection.already_connected?
end.sort_by(&:distance).first.tap do |connection|
  puts "The last connection to connect the final two circuits is:"
  puts "Connecting boxes at (#{connection.box1.x}, #{connection.box1.y}, #{connection.box1.z}) and (#{connection.box2.x}, #{connection.box2.y}, #{connection.box2.z}) with distance #{'%.2f' % connection.distance}"
  puts "The product of the X coordinates is #{connection.box1.x * connection.box2.x}"
end

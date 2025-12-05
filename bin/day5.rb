#!/usr/bin/env ruby
require_relative "../lib/inventory"

fresh_items = []

lines = File.readlines("inputs/day05.txt").map(&:strip)
seperator = lines.find_index("")

fresh_items = lines[0...seperator]

puts "Found #{fresh_items.size} fresh item ranges."

inventory = Inventory.new(fresh_items)

puts "Checking #{lines[(seperator + 1)..-1].size} ingredients for freshness..."

fresh_ingredients = lines[(seperator + 1)..-1].count do |ingredient_id|
  result = inventory.is_fresh?(ingredient_id)
  result
end

puts "Found #{fresh_ingredients} fresh items."

puts "-----"

puts "All fresh ingredients: #{inventory.all_fresh_ingredients}"



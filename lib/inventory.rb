class Inventory
  def initialize(fresh_items)
    @fresh_items = fresh_items.map do |line|
      line.split("-").map(&:to_i)
    end
  end

  def find_matching_ranges(item)
    @fresh_items.find_all do |range|
      (start_id, end_id) = range
      (start_id..end_id).cover?(item.to_i)
    end
  end

  def is_fresh?(item)
    find_matching_ranges(item).size > 0
  end

  def all_fresh_ingredients
    @fresh_items.map do |range|
      find_largest_possible_range(range)
    end.uniq.sum do |range|
      (range.last.to_i - range.first.to_i) + 1
    end
  end

  def find_largest_possible_range(range)
    result = [
      find_matching_ranges(range.first).map { |range| range.first }.min,
      find_matching_ranges(range.last).map { |range| range.last }.max
    ]

    (result == range) ? result : find_largest_possible_range(result)
  end
end

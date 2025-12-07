class TachyonManifold
  def initialize(input)
    @dimensions = input.split("\n").map(&:strip)
  end

  def split_count
    index = @dimensions.first.index("S")

    count_splits([index], 1)
  end

  def count_splits(indices, line_number)
    return indices.size if line_number >= @dimensions.count

    puts "Line #{line_number}: indices #{indices.inspect}"

    result = indices.map do |index|
      char = @dimensions[line_number][index]
      (char == "^") ? [index - 1, index + 1] : index
    end
    count_splits(result.flatten, line_number + 1)
  end
end

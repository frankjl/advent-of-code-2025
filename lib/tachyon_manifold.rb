class TachyonManifold
  def initialize(input)
    @lines = input.split("\n").map(&:strip)
  end

  def split_count
    index = @lines.first.index("S")
    count_splits(index)
  end

  def count_splits(index)
    counter = IndexCounter.new
    counter.increment(index)

    @lines[1..].each do |line|
      counter.indices.each do |index|
        char = line[index]
        counter.split(index) if char == "^"
      end
    end

    counter.paths
  end

  class IndexCounter
    attr_reader :counter

    def initialize
      @counter = Hash.new(0)
    end

    def increment(index)
      @counter[index] += 1
    end

    def split(index)
      count = @counter[index]
      @counter.delete(index)
      @counter[index - 1] += count
      @counter[index + 1] += count
    end

    def indices
      @counter.keys
    end

    def paths
      @counter.values.sum
    end
  end
end

class TachyonManifold
  def initialize(input)
    @lines = input.split("\n").map(&:strip)
  end

  def count_splits
    start_tachyon_beam.number_of_splits
  end

  def count_all_possible_timelines
    start_tachyon_beam.timelines
  end

  def start_tachyon_beam
    index = @lines.first.index("S")
    counter = IndexCounter.new
    counter.increment(index)

    @lines[1..].each do |line|
      counter.indices.each do |index|
        char = line[index]
        counter.split(index) if char == "^"
      end
    end
    counter
  end

  class IndexCounter
    attr_reader :counter, :number_of_splits

    def initialize
      @counter = Hash.new(0)
      @number_of_splits = 0
    end

    def increment(index)
      @counter[index] += 1
    end

    def split(index)
      @number_of_splits += 1
      count = @counter[index]
      @counter.delete(index)
      @counter[index - 1] += count
      @counter[index + 1] += count
    end

    def indices
      @counter.keys
    end

    def timelines
      @counter.values.sum
    end
  end
end

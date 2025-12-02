class IdRange
  attr_reader :start_id, :end_id

  def initialize(start_id, end_id)
    @start_id = start_id
    @end_id = end_id
  end

  def find_invalid
    # For all IDs in the range, count how many are invalid
    (start_id..end_id).find_all { |id| invalid_id?(id) }
  end

  def invalid_id?(id)
    /^(\d+)(\1)+$/ =~ id.to_s
  end

  def self.parse(input)
    input.strip.split(",").sum do |range|
      (start, stop) = range.split("-").map(&:to_i)
      puts "Processing range #{start}-#{stop}"
      IdRange.new(start, stop).find_invalid.sum
    end
  end
end

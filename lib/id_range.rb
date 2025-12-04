class IdRange
  attr_reader :start_id, :end_id

  def initialize(start_id, end_id)
    @start_id = start_id
    @end_id = end_id
  end

  def find_invalid
    # For all IDs in the range, count how many are invalid
    (start_id..end_id).find_all { |id| is_invalid?(id) }
  end

  def is_invalid?(id)
    /^(\d+)(\1)+$/ =~ id.to_s
  end
end

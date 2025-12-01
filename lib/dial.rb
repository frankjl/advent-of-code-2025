class Dial
  def initialize
    @counter = starting_point
    @password = 0
  end

  def spin(code)
    direction = code[0]
    steps = code[1..].to_i % clicks

    case direction
    when "L"
      @counter = (counter >= steps) ? (counter - steps) : (counter + clicks - steps)
    when "R"
      @counter = (counter + steps) % clicks
    else
      raise "Invalid direction"
    end

    puts "The dial is rotated #{code} to point at #{counter}"
    @password += 1 if counter == 0
  end

  attr_reader :counter, :password

  def starting_point
    50
  end

  def clicks
    100
  end
end

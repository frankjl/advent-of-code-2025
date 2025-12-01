class Dial
  attr_reader :counter, :password

  def initialize
    @counter = starting_point
    @password = 0
  end

  def spin(code)
    direction = code[0]
    steps = code[1..].to_i

    @password += (steps / clicks).floor
    steps %= clicks

    case direction
    when "L"
      if @counter == 0
        @counter = clicks - steps
      else
        @counter -= steps
        while @counter < 0
          @counter += clicks
          @password += 1
        end
        @password += 1 if @counter == 0
      end
    when "R"
      @counter += steps
      while @counter >= clicks
        @counter -= clicks
        @password += 1
      end
    else
      raise "Invalid direction"
    end
  end

  def starting_point
    50
  end

  def clicks
    100
  end
end

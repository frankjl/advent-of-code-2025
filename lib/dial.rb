class Dial
  attr_reader :password

  def initialize
    @counter = starting_point
    @password = 0
  end

  def spin(code)
    direction = code[0]
    steps = code[1..].to_i

    steps.times do
      click((direction == "L") ? -1 : 1)
    end
  end

  def click(step)
    @counter += step
    @password += 1 if @counter % clicks == 0
  end

  def current
    (@counter < 0) ? (clicks - @counter.abs) % clicks : @counter % clicks
  end

  def starting_point
    50
  end

  def clicks
    100
  end
end

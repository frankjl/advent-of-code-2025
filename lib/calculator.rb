class Calculator
  def initialize(lines)
    @operators = lines.split("\n").last
    @operands = lines.split("\n")[0..-2]
  end

  def value
    numbers = []
    result = []

    @operators.reverse.chars.each_with_index.map do |operator, index|
      number = cephalod_number(@operators.size - 1 - index)

      numbers << number if number > 0

      if operator == "+"
        # Calculate the sum of all of the cephalod numbers
        result << numbers.sum
        numbers.clear
      elsif operator == "*"
        # Calculate the product of the cephalod numbers
        result << numbers.reduce(1) { |sum, num| sum * num }
        numbers.clear
      end
    end

    result
  end

  def cephalod_number(index)
    @operands.map do |line|
      line[index]
    end.join.to_i
  end
end

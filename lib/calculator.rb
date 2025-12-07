class Calculator
  def initialize(lines)
    @operators = lines.split("\n").last.scan(/[+*]\s+/)
    @operands = lines.split("\n")[0..-2]
  end

  def value
    index = -1

    @operators.map do |operator|
      numbers = operator.chars.map do
        index += 1
        cephalod_number(index)
      end.find_all { |x| x > 0 }

      (operator.strip == "+") ? numbers.sum : numbers.reduce(1) { |sum, num| sum * num }
    end
  end

  def cephalod_number(index)
    @operands.map do |line|
      line[index]
    end.join.to_i
  end
end

class BatteryBank
  attr_reader :batteries
  def initialize(batteries)
    @batteries = batteries
  end

  def find_largest_joltage(n = 2)
    BatteryBank.find_largest(batteries, n)
  end

  def self.find_largest(batteries, n)
    joltage = batteries[0..-n].max
    index = batteries.find_index(joltage)

    (n > 1) ? [
      joltage, BatteryBank.find_largest(batteries[(index + 1)..], n - 1)
    ].join.to_i : joltage
  end
end

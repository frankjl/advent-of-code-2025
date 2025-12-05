require_relative "../lib/battery_bank"
require "spec_helper"

describe(BatteryBank) do
  describe "#find_largest_joltage" do
    it "finds the largest joltage battery" do
      bank = BatteryBank.new("987654321111111".chars.map(&:to_i))
      expect(bank.find_largest_joltage(2)).to eq(98)
    end

    it "finds the largest joltage battery with n=3" do
      bank = BatteryBank.new("811111111111119".chars.map(&:to_i))
      expect(bank.find_largest_joltage(3)).to eq(819)
    end

    it "finds the largest joltage battery with n=2" do
      bank = BatteryBank.new("234234234234278".chars.map(&:to_i))
      expect(bank.find_largest_joltage(2)).to eq(78)
    end

    it "finds the largest joltage battery with n=12" do
      bank = BatteryBank.new("987654321111111".chars.map(&:to_i))
      expect(bank.find_largest_joltage(12)).to eq(987654321111)
    end
  end
end

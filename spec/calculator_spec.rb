require_relative "../lib/calculator"
require "spec_helper"

RSpec.describe Calculator do
  describe "#initialize" do
    it "sets the counter to the starting point" do
      s = <<~GRID
        123 328  51 64 
         45 64  387 23 
          6 98  215 314
        *   +   *   +  
      GRID
      calculator = Calculator.new(s)

      expect(calculator.value.sum).to eq(3263827)
    end
  end
end

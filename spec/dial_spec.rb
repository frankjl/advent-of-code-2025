require_relative "../lib/dial"
require "spec_helper"

RSpec.describe Dial do
  let(:dial) { Dial.new }

  describe "#initialize" do
    it "sets the counter to the starting point" do
      expect(dial.instance_variable_get(:@counter)).to eq(50)
    end
  end

  describe "#spin" do
    context "when spinning left within bounds" do
      it "decreases the counter correctly" do
        dial.spin("L20")
        expect(dial.counter).to eq(30)
      end
    end
    context "when spinning left beyond zero" do
      it "wraps around correctly" do
        dial.spin("L60")
        expect(dial.counter).to eq(90)
      end
    end
    context "when spinning right within bounds" do
      it "increases the counter correctly" do
        dial.spin("R30")
        expect(dial.counter).to eq(80)
      end
    end
    context "when spinning right beyond maximum" do
      it "wraps around correctly" do
        dial.spin("R60")
        expect(dial.counter).to eq(10)
      end
    end

    context "when it hits zero the password increments" do
      it "increments the password" do
        dial.spin("L50") # from 50 to 0
        expect(dial.password).to eq(1)
        dial.spin("R100") # from 0 to 0
        expect(dial.password).to eq(2)
      end
    end

    context "when given the sample input" do
      it "produces the correct password" do
        dial.spin("L68") # to 82
        expect(dial.password).to eq(1)
        dial.spin("L30") # to 52
        expect(dial.password).to eq(1)
        dial.spin("R48") # to 0
        expect(dial.password).to eq(2)
        dial.spin("L5")  # to 95
        expect(dial.password).to eq(2)
        dial.spin("R60") # to 55
        expect(dial.password).to eq(3)
        dial.spin("L55") # to 0
        expect(dial.password).to eq(4)
        dial.spin("L1")  # to 99
        expect(dial.password).to eq(4)
        dial.spin("L99") # to 0
        expect(dial.password).to eq(5)
        dial.spin("R14") # to 14
        expect(dial.password).to eq(5)
        dial.spin("L82") # to 32
        expect(dial.password).to eq(6)
      end
    end
  end
end

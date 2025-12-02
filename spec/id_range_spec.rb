require_relative "../lib/id_range"
require "spec_helper"

describe IdRange do
  describe "#count_invalid" do
    it "counts invalid IDs in the 11-22 range" do
      id_range = IdRange.new(11, 22)
      expect(id_range.find_invalid.size).to eq(2) # 11 and 22 are invalid
    end

    it "counts invalid IDs in the 95-115 range" do
      id_range = IdRange.new(95, 115)
      expect(id_range.find_invalid.size).to eq(2) # Only 99 is invalid
    end

    it "counts invalid IDs in the 998-1012 range" do
      id_range = IdRange.new(998, 1012)
      expect(id_range.find_invalid.size).to eq(2) # Only 1010 is invalid
    end

    it "counts invalid IDs in the 1188511880-1188511890 range" do
      id_range = IdRange.new(1188511880, 1188511890)
      expect(id_range.find_invalid.size).to eq(1)
    end
  end

  describe ".parse" do
    it "parses multiple ranges and counts invalid IDs" do
      input = "11-22,95-115,998-1012"
      expect(IdRange.parse(input)).to eq(2252)
    end
  end
end

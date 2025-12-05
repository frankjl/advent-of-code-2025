require_relative "../lib/inventory"

describe Inventory do
  describe "#is_fresh?" do
    it "returns true for an item in a fresh range" do
      inventory = Inventory.new(["10-20", "30-40"])
      expect(inventory.is_fresh?(15)).to be true
      expect(inventory.is_fresh?(35)).to be true
    end

    it "returns false for an item not in any fresh range" do
      inventory = Inventory.new(["10-20", "30-40"])
      expect(inventory.is_fresh?(25)).to be false
      expect(inventory.is_fresh?(45)).to be false
    end
  end

  describe "#find_largest_possible_range" do
    it "should find all possible fresh ids" do
      inventory = Inventory.new(["10-20", "30-40"])
      expect(inventory.all_fresh_ingredients).to eq 22
    end
  end
end

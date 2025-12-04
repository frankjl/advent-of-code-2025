require_relative "../lib/grid"

describe Grid do
  describe "#is_accessible?" do
    it "returns true for accessible cell" do
      input = <<~GRID
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
      GRID

      grid = Grid.new(input)
      expect(grid.is_accessible?(0, 0)).to be false
      expect(grid.is_accessible?(2, 0)).to be true
      expect(grid.get_all_accessible(1).size).to eq 13
    end
  end

  describe "#mark_accessible" do
    it "marks a cell as accessible" do
      input = <<~GRID
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
      GRID

      grid = Grid.new(input)
      grid.mark_accessible(2, 0)
      expect(grid.grid[0]).to eq "..x@.@@@@."
      expect(grid.is_accessible?(2, 0)).to be false
    end
  end
end

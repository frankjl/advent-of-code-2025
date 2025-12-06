class Grid
  attr_reader :grid, :rows, :cols

  def initialize(input)
    @grid = input.split("\n").map(&:strip)
    @rows = grid.size
    @cols = grid.sum { |row| row.size } / @rows
  end

  def accessible_threshold
    4
  end

  def is_toilet_paper?(x, y)
    (0..rows - 1).cover?(y) && (0..cols - 1).cover?(x) && @grid[y][x].strip == "@"
  end

  def is_accessible?(col, row, n = 1)
    adjacent = []
    ((row - n)..(row + n)).each do |y|
      ((col - n)..(col + n)).each do |x|
        adjacent << [x, y] unless x == col && y == row
      end
    end

    count = adjacent.count do |coordinate|
      (x, y) = coordinate
      is_toilet_paper?(x, y)
    end

    is_toilet_paper?(col, row) && count < accessible_threshold
  end

  def mark_accessible(x, y)
    replacement = @grid[y].chars
    replacement[x] = "x"
    @grid[y] = replacement.join
  end

  def get_all_accessible(n = 1)
    list = []
    (0...cols).each do |x|
      (0...rows).each do |y|
        if is_accessible?(x, y, n)
          list << [x, y]
        end
      end
    end
    list
  end
end

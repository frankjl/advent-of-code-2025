require_relative "../lib/junction_box"

describe(JunctionBox) do
  describe "#connect" do
    it "connects two junction boxes" do
      box1 = JunctionBox.new(0, 0, 0)
      box2 = JunctionBox.new(1, 1, 1)

      box1.connect(box2)

      expect(box1.circuit.boxes).to include(box2)
      expect(box2.circuit.boxes).to include(box1)
    end
    it "connects three junction boxes" do
      box1 = JunctionBox.new(0, 0, 0)
      box2 = JunctionBox.new(1, 1, 1)
      box3 = JunctionBox.new(2, 2, 2)

      box1.connect(box2)
      box2.connect(box3)

      expect(box1.circuit.boxes).to include(box2)
      expect(box2.circuit.boxes).to include(box1)
      expect(box2.circuit.boxes).to include(box3)
      expect(box3.circuit.boxes).to include(box2)
    end
  end

  describe "#distance_from" do
    it "calculates the distance between two junction boxes" do
      box1 = JunctionBox.new(0, 0, 0)
      box2 = JunctionBox.new(3, 4, 0)

      expect(box1.distance_from(box2)).to eq(5.0)
    end
  end

  describe ".find_closest" do
    it "finds the closest junction box from a list" do
      box1 = JunctionBox.new(0, 0, 0)
      box2 = JunctionBox.new(1, 1, 1)
      box3 = JunctionBox.new(5, 5, 5)

      closest = JunctionBox.find_closest([box1, box2, box3]).first
      # This test is illustrative; adjust as needed based on actual method behavior
      expect(closest.box1).to eq(box1).or eq(box2)
      expect(closest.box2).to eq(box1).or eq(box2)
      expect(closest.distance).to eq(Math.sqrt(3))
    end
  end

  describe(JunctionBox::Connection) do
    describe "#connect" do
      it "connects two junction boxes via connection" do
        input = "162,817,812
57,618,57
906,360,560
592,479,940
352,342,300
466,668,158
542,29,236
431,825,988
739,650,466
52,470,668
216,146,977
819,987,18
117,168,530
805,96,715
346,949,466
970,615,88
941,993,340
862,61,35
984,92,344
425,690,689
"
        boxes = input.lines.map do |line|
          x, y, z = line.strip.split(",").map(&:to_i)
          JunctionBox.new(x, y, z)
        end

        connections = JunctionBox.find_closest(boxes).take(10)
        connections.each do |connection|
          connection.connect
        end

        circuits = boxes.map(&:circuit).uniq
        expect(circuits.size).to eq(11)

        # Take the top 3 largest circuits and multiply their sizes
        product = circuits.sort_by(&:size).reverse.take(3).reduce(1) { |prod, circuit| prod * circuit.size }

        expect(product).to eq(40)
      end
    end
  end
end

class JunctionBox
  attr_reader :x, :y, :z, :circuit

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
    @circuit = Circuit.new(self)
  end

  def coordinates
    [x, y, z]
  end

  def connect(other)
    return if circuit == other.circuit
    # Use the other circuit
    boxes = circuit.boxes
    @circuit = other.circuit
    other.circuit.boxes << self unless other.circuit.boxes.include?(self)
    boxes.each do |box|
      box.connect(self) unless box == self
    end
  end

  def distance_from(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2 + (z - other.z)**2)
  end

  def self.find_closest(boxes)
    boxes.flat_map do |dis|
      boxes.map do |dat|
        (dis != dat) ? Connection.new(dis, dat) : nil
      end
    end.flatten.compact.uniq(&:id).reject do |connection|
      connection.already_connected?
    end.sort_by(&:distance)
  end

  class Circuit
    attr_reader :boxes

    def initialize(box)
      @boxes = [box]
    end

    def size
      @boxes.size
    end
  end

  class Connection
    attr_reader :box1, :box2

    def initialize(box1, box2)
      @box1 = box1
      @box2 = box2
    end

    def distance
      box1.distance_from(box2)
    end

    def connect
      box1.connect(box2)
    end

    def already_connected?
      box1.circuit == box2.circuit
    end

    def id
      [box1, box2].sort_by(&:coordinates).join
    end
  end
end

class Position
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def +(other)
    new_position = Position.new(self.x + other.x, 
                                self.y + other.y)
    
    if new_position.valid?
      return new_position 
    else
      return self
    end
  end

  def ==(other)
    return @x == other.x && @y == other.y
  end

  def report
    return "[#{@x}, #{@y}]"
  end

  def valid?
    max_position = Table.max_position
    return @x && @y &&
      @x >= 0 && @x <= max_position.x &&
      @y >= 0 && @y <= max_position.y
  end

  def self.valid_position(x, y)
    return Position.new(x, y).valid?
  end

  def self.create(x = nil, y = nil)
    return Position.new(x, y) if valid_position(x, y)
  end

  def self.from_str(str)
    tokens = str.split(',')
    x = tokens.first.to_i
    y = tokens.last.to_i
    return Position.new(x, y)
  end
end
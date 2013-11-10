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

  def report
    return "[#{@x}, #{@y}]"
  end

  def valid?
    return @x && @y &&
      @x >= 0 && @x <= 10 &&
      @y >= 0 && @y <= 10
  end

  def self.valid_position(x, y)
    return Position.new(x, y).valid?
  end

  def self.create(x = nil, y = nil)
    return Position.new(x, y) if valid_position(x, y)
  end
end
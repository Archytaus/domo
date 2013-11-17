class Position
  attr_accessor :x, :y
  @@x_min = 0 
  @@x_max = 10 
  @@y_min = 0
  @@y_max = 10

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
      @x >= @@x_min && @x <= @@y_max &&
      @y >= @@y_min && @y <= @@y_max
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
    return Position.new(x, y) if valid_position(x, y)
  end
end
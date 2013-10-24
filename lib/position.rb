class Position
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def +(other)
    return Position.new(self.x + other.x, 
                        self.y + other.y)
  end

  def report
    return "[#{@x}, #{@y}]"
  end
end
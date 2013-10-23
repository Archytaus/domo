class Location
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def report
    "[#{@x}, #{@y}] #{@direction.report}"
  end
end
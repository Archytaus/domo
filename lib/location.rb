class Location
  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def report
    "#{@position.report} #{@direction.report}"
  end

  def move_forward
    @position += @direction.to_position
  end

  def rotate_left
    @direction = @direction.rotate_left
  end

  def rotate_right
    @direction = @direction.rotate_right
  end

  def self.create(x, y, direction)
    Location.new(Position.new(x, y), Direction.from_str(direction))
  end
end
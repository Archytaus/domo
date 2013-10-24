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
    @direction.rotate_left
  end

  def rotate_right
    @direction.rotate_right
  end
end
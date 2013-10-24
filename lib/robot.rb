class Robot
  def initialize(location = nil)
    @location = location
  end

  def place(x, y, direction)
    @location = Location.create(x, y, direction)
  end

  def report
    @location.report
  end

  def move
    @location.move_forward
  end

  def rotate_left
    @location.rotate_left
  end

  def rotate_right
    @location.rotate_right
  end
end
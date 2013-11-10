class Robot
  attr_accessor :location

  def initialize
    @location = Location.create
  end

  def place(x, y, direction)
    new_location = Location.create(x, y, direction)
    @location = new_location if new_location.valid?
    nil
  end

  def report
    @location.report
  end

  def move
    @location.move_forward
    nil
  end

  def rotate_left
    @location.rotate_left
    nil
  end

  def rotate_right
    @location.rotate_right
    nil
  end
end
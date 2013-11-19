class Robot
  attr_accessor :location

  def initialize
    @location = Location.create
  end

  def place(x, y, direction)
    new_location = Location.create(x, y, direction)
    @location = new_location if new_location.valid? && Table.can_move_to?(new_location)
    nil
  end

  def report
    @location.report
  end

  def move
    @location.move_forward if Table.can_move_to?(@location.forward_position)
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

  def clean
    if Table.clean_at(@location.forward_position)
      "Cleaned Dirt"
    else 
      "Nothing to clean"
    end
  end
end
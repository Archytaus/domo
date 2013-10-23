class Robot
  def place(location)
    @location = location
  end

  def report
    @location.report
  end

  def move
    @location.move
  end

  def rotate_left
    @location.rotate_left
  end

  def rotate_right
    @location.rotate_right
  end
end
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
end
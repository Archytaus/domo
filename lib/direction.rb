class NorthDirection
  def rotate_left
    return WestDirection.new
  end

  def rotate_right
    return EastDirection.new
  end

  def to_position
    Position.new(0, 1)
  end

  def report
    "North"
  end
end

class SouthDirection
  def rotate_left
    return EastDirection.new
  end

  def rotate_right
    return WestDirection.new
  end

  def to_position
    Position.new(0, -1)
  end

  def report
    "South"
  end
end

class EastDirection
  def rotate_left
    return NorthDirection.new
  end

  def rotate_right
    return SouthDirection.new
  end

  def to_position
    Position.new(1, 0)
  end

  def report
    "East"
  end
end

class WestDirection
  def rotate_left
    return SouthDirection.new
  end

  def rotate_right
    return NorthDirection.new
  end

  def to_position
    Position.new(-1, 0)
  end

  def report
    "West"
  end
end
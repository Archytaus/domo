class InvalidLocation
  def initialize
  end

  def valid?
    false
  end

  def report
    "INVALID ROBOT PLACEMENT"
  end

  def forward_position
    nil
  end

  def move_forward
  end

  def rotate_left
  end

  def rotate_right
  end
end
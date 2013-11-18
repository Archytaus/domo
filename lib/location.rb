class Location
  def initialize(position, direction)
    @position = position
    @direction = direction
  end

  def report
    "#{@position.report} #{@direction.report}"
  end

  def valid?
    true
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

  def forward_position
    return @position + @direction.to_position
  end

  def self.create(x = nil, y = nil, direction_str = nil)    
    position = Position.create(x, y)
    direction = Direction.from_str(direction_str)
    
    return InvalidLocation.new if position.nil? || direction.nil?
    
    return Location.new(position, direction) 
  end
end
class Table
  attr_reader :max_position
  attr_reader :dirts
  attr_reader :robot

  def initialize(max_position)
    @max_position = max_position
    @robot = Robot.new
    @dirts = []
  end

  def place_dirt(dirt_positions)
    dirt_positions.each do |dirt_position|
      dirts << Dirt.new(dirt_position)
    end
  end
end
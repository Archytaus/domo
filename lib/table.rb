class Table
  attr_reader :max_position
  attr_reader :dirts
  attr_reader :robot

  def initialize(max_position)
    @@current = self

    @max_position = max_position
    @robot = Robot.new
    @dirts = []
  end

  def place_dirt(dirt_positions)
    dirt_positions.each do |dirt_position|
      dirts << Dirt.new(dirt_position)
    end
  end

  def dirt_at(position)
    return @dirts.select { |dirt| dirt.position == position }.first
  end

  def self.current=(table)
    @@current = table
  end

  def self.max_position
    @@current.max_position
  end

  def self.has_dirt_at?(position)
    return @@current.dirt_at(position) != nil
  end
end
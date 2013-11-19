class Table
  attr_reader :max_position
  attr_reader :dirts
  attr_reader :robot

  def initialize(max_position = nil)
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

  def clean_at(position)
    dirt = dirt_at(position)
    @dirts.delete(dirt) if dirt
    return !dirt.nil?
  end

  def has_dirt_at?(position)
    !dirt_at(position).nil?
  end

  def can_move_to?(position)
    !has_dirt_at?(position)
  end

  def self.current
    @@current
  end

  def self.current=(table)
    @@current = table
  end

  def self.max_position
    @@current.max_position
  end

  def self.can_move_to?(position)
    return @@current.can_move_to?(position)
  end

  def self.has_dirt_at?(position)
    return @@current.has_dirt_at?(position)
  end

  def self.clean_at(position)
    @@current.clean_at(position)
  end
end
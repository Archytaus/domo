describe Position do

  before do
    @table = Minitest::Mock.new
    Table.current = @table

    @table.expect :max_position, Position.new(10, 10)
  end

  it 'can be created' do
    @table.expect :has_dirt_at?, false, [Position]

    @position = Position.create(0, 0)
    assert_equal 0, @position.x
    assert_equal 0, @position.y
  end

  it 'can be added' do
    @table.expect :has_dirt_at?, false, [Position]

    @position = Position.new(3, 3) + Position.new(3, 3)
    assert_equal 6, @position.x
    assert_equal 6, @position.y
  end

  it 'can be reported' do
    @table.expect :has_dirt_at?, false, [Position]

    @position = Position.new(10, 10)
    assert_equal "[10, 10]", @position.report
  end

  it 'cannot be created outside [0,0] and the table size' do
    position = Position.create(-1, -1)
    assert_nil position

    @table.expect :max_position, Position.new(10, 10)
    position = Position.create(11, 11)
    assert_nil position
  end

  it 'cannot be added outside [0,0] and [10,10]' do
    position = Position.new(0, 0) + Position.new(-1, -1)
    assert_equal 0, position.x
    assert_equal 0, position.y

    @table.expect :max_position, Position.new(10, 10)
    position = Position.new(10, 10) + Position.new(10, 10)
    assert_equal 10, position.x
    assert_equal 10, position.y
  end
end
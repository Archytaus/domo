describe Position do
  
  it 'can be created' do
    @position = Position.create(0, 0)
    assert_equal 0, @position.x
    assert_equal 0, @position.y

    @position = Position.create(10, 10)
    assert_equal 10, @position.x
    assert_equal 10, @position.y
  end

  it 'can be added' do
    @position = Position.new(10, 10) + Position.new(10, 10)
    assert_equal 20, @position.x
    assert_equal 20, @position.y
  end

  it 'can be reported' do
    @position = Position.new(10, 10)
    assert_equal "[10, 10]", @position.report
  end

  it 'cannot be created outside [0,0] and [10,10]' do
    position = Position.create(-1, -1)
    assert_nil position

    position = Position.create(11, 11)
    assert_nil position
  end
end
describe Robot do
  before do
    @location_mock = Minitest::Mock.new
    
    @table = Minitest::Mock.new
    Table.current = @table
    @table.expect :max_position, Position.new(10, 10)

    @robot = Robot.new
    @robot.location = @location_mock
  end

  it 'can report its location' do
    @location_mock.expect :report, '[1, 2] North'

    assert @robot.respond_to?(:report), 'expected the robot to have a report method'

    assert_equal '[1, 2] North', @robot.report
    @location_mock.verify
  end

  it 'can move forward' do    
    @location_mock.expect :move_forward, nil

    assert @robot.respond_to?(:move), 'expected the robot to have a move method'
    @robot.move

    @location_mock.verify
  end

  it 'can rotate left' do
    @location_mock.expect :rotate_left, nil

    assert @robot.respond_to?(:rotate_left), 'expected the robot to have a rotate_left method'
    @robot.rotate_left

    @location_mock.verify
  end

  it 'can rotate right' do
    @location_mock.expect :rotate_right, nil

    assert @robot.respond_to?(:rotate_right), 'expected the robot to have a rotate_right method'
    @robot.rotate_right

    @location_mock.verify
  end
end
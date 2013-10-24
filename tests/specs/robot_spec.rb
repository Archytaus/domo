describe Robot do
  before do
    @location_mock = Minitest::Mock.new
    @robot = Robot.new
  end

  it 'can be placed' do
    assert @robot.respond_to?(:place), 'expected the robot to have a place method'

    @robot.place(@location_mock)
  end

  it 'can report its location' do
    @location_mock.expect :report, '[1, 2] North'

    assert @robot.respond_to?(:report), 'expected the robot to have a report method'

    @robot.place(@location_mock)
    assert_equal @robot.report, '[1, 2] North'
    @location_mock.verify
  end

  it 'can move forward' do    
    @location_mock.expect :move_forward, nil

    assert @robot.respond_to?(:move), 'expected the robot to have a move method'

    @robot.place(@location_mock)
    @robot.move

    @location_mock.verify
  end

  it 'can rotate left' do
    @location_mock.expect :rotate_left, nil

    assert @robot.respond_to?(:rotate_left), 'expected the robot to have a rotate_left method'

    @robot.place(@location_mock)
    @robot.rotate_left

    @location_mock.verify
  end

  it 'can rotate right' do
    @location_mock.expect :rotate_right, nil

    assert @robot.respond_to?(:rotate_right), 'expected the robot to have a rotate_right method'

    @robot.place(@location_mock)
    @robot.rotate_right

    @location_mock.verify
  end
end
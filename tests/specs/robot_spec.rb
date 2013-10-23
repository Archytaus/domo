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
  end

  it 'can move forward' do    
    @location_mock.expect :report, '[1, 3] North'
    @location_mock.expect :move, nil

    assert @robot.respond_to?(:move), 'expected the robot to have a move method'

    @robot.place(@location_mock)
    @robot.move

    assert_equal @robot.report, '[1, 3] North'
    @location_mock.verify
  end
end
describe Robot do
  before do
    @location_mock = Minitest::Mock.new
    @robot = Robot.new
  end

  it 'can be placed' do
    assert @robot.respond_to?(:place), 'expected the robot to have a place method'

    @robot.place(@location_mock)
  end
end
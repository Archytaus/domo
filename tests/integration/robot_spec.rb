describe Robot do
  before do
    @robot = Robot.new
  end

  it 'can be placed' do
    assert @robot.respond_to?(:place), 'expected the robot to have a place method'
    @robot.place(0, 0, 'North')
  end
end
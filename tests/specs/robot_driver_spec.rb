describe RobotController do
  before do
    @robot_mock = Minitest::Mock.new
    @robot_controller = RobotController.new(@robot_mock)
  end

  it 'can interpret the PLACE command' do
    @robot_mock.expect :place, nil, [1, 1, 'NORTH']
    @robot_controller.interpret_command('PLACE 1,1,NORTH')

    @robot_mock.verify
  end
end
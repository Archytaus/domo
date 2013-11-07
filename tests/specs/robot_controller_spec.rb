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

  it 'can interpret the LEFT command' do
    @robot_mock.expect :rotate_left, nil
    @robot_controller.interpret_command('LEFT')

    @robot_mock.verify
  end

  it 'can interpret the RIGHT command' do
    @robot_mock.expect :rotate_right, nil
    @robot_controller.interpret_command('RIGHT')

    @robot_mock.verify
  end

  it 'can interpret the MOVE command' do
    @robot_mock.expect :move, nil
    @robot_controller.interpret_command('MOVE')

    @robot_mock.verify
  end

  it 'can interpret the REPORT command' do
    @robot_mock.expect :report, nil
    @robot_controller.interpret_command('REPORT')

    @robot_mock.verify
  end
end
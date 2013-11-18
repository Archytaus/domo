describe RobotController do
  before do
    @robot_mock = Minitest::Mock.new

    @table_mock = Minitest::Mock.new
    Table.current = @table_mock
    @table_mock.expect :robot, @robot_mock
    
    @robot_controller = RobotController.new(@table_mock)
  end

  it 'can interpret the PLACE command' do
    @robot_mock.expect :place, nil, [1, 1, 'NORTH']
    @robot_controller.place(['1,1,NORTH'])

    @robot_mock.verify
  end

  it 'handles invalid PLACE arguments' do
    invalid_args = '1'
    assert_raises(RuntimeError) { @robot_controller.place([invalid_args]) }

    begin
      @robot_controller.place([invalid_args])
    rescue Exception => e
      assert_equal "wrong number of arguments (1 expected 3)", e.to_s
    end
    
    @robot_mock.verify
  end

  it 'can interpret the LEFT command' do
    @robot_mock.expect :rotate_left, nil
    @robot_controller.left

    @robot_mock.verify
  end

  it 'can interpret the RIGHT command' do
    @robot_mock.expect :rotate_right, nil
    @robot_controller.right

    @robot_mock.verify
  end

  it 'can interpret the MOVE command' do
    @robot_mock.expect :move, nil
    @robot_controller.move

    @robot_mock.verify
  end

  it 'can interpret the REPORT command' do
    @robot_mock.expect :report, nil
    @robot_controller.report

    @robot_mock.verify
  end

  it 'handles invalid commands' do
    assert_raises(RuntimeError) { @robot_controller.invalid_command }

    begin
      @robot_controller.invalid_command  
    rescue Exception => e
      assert_equal "Unknown command: 'invalid_command'", e.to_s
    end
    
    @robot_mock.verify
  end
end
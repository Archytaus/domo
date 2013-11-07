describe Robot do
  before do
    @robot = Robot.new
  end

  it 'can be placed' do
    assert @robot.respond_to?(:place), 'expected the robot to have a place method'
    @robot.place(0, 0, 'North')
  end

  it 'can be placed in an invalid position' do
    @robot.place(-1, -1, 'North')
  end

  it 'ignores commands called before place' do
    @robot.move
    @robot.rotate_left
    assert_equal 'INVALID ROBOT PLACEMENT', @robot.report
    @robot.place(3, 3, 'South')
    assert_equal '[3, 3] South', @robot.report
  end

  it 'ignores invalid place commands' do
    @robot.place(3, 3, 'South')
    @robot.place(11, 11, '')
    assert_equal '[3, 3] South', @robot.report
  end

  it 'can move around and report' do
    @robot.place(3, 3, 'South')
    @robot.move
    assert_equal '[3, 2] South', @robot.report

    @robot.rotate_left
    @robot.move
    assert_equal '[4, 2] East', @robot.report    
  end
end
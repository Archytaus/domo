class RobotController
  @@commands_map = {
    'PLACE' => PlaceCommand.new,
    'LEFT' => LeftCommand.new,
    'RIGHT' => RightCommand.new,
  }
  def initialize(robot)
    @robot = robot
  end

  def find_command(command_name)
    @@commands_map[command_name.upcase]
  end

  def interpret_command(command)
    command_params = command.split(' ')
    command_name = command_params.first
    command = find_command(command_name)

    command.evaluate(@robot, command_params.last) if command
  end
end
class RobotController
  @@commands_map = {
    'PLACE' => PlaceCommand.new,
    'LEFT' => LeftCommand.new,
    'RIGHT' => RightCommand.new,
    'REPORT' => ReportCommand.new,
    'MOVE' => MoveCommand.new
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

    if command
      command.evaluate(@robot, command_params.last)
    end
  end
end
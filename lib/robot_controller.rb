class RobotController
  def initialize(table)
    @table = table
    @robot = table.robot
  end

  def place(args)
    split_args = args.first.split(',')
    if split_args.size != 3
      raise "wrong number of arguments (#{split_args.size} expected 3)"
    end

    @robot.place(split_args[0].to_i, split_args[1].to_i, split_args[2].upcase)
  end

  def left
    @robot.rotate_left
  end

  def right
    @robot.rotate_right
  end

  def report
    @robot.report
  end

  def move
    @robot.move
  end

  def clean
    @robot.clean
  end

  def method_missing(name, *args, &block)
    raise "Unknown command: '#{name}'"
  end
end
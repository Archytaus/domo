class PlaceCommand
  def evaluate(robot, args)
    split_args = args.split(',')
    robot.place(split_args[0].to_i, split_args[1].to_i, split_args[2].upcase)
  end
end

class LeftCommand
  def evaluate(robot, args)
    robot.rotate_left
  end
end

class RightCommand
  def evaluate(robot, args)
    robot.rotate_right
  end
end
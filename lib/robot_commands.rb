class PlaceCommand
  def evaluate(robot, args)
    split_args = args.split(',')
    robot.place(split_args[0].to_i, split_args[1].to_i, split_args[2].upcase)
  end
end
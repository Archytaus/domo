Dir["./lib/*.rb"].each {|file| require file }

puts 'Robot Code Kata'
puts '================'
puts 'Commands are: - PLACE X,Y,DIRECTION'
puts '              - LEFT'
puts '              - RIGHT'
puts '              - MOVE'
puts '              - REPORT'
puts 'A blank empty line will quit the program'


def is_quit(input)
  input.empty?
end

controller = RobotController.new

running = true
while(running)
  input = gets.chomp.downcase
  
  if is_quit(input)
    running = false 
    next
  end
  input_split = input.split(' ')
  command = input_split.first
  args = input_split[1..-1]
  begin
    if (args.empty?)
      response = controller.send(command)
    else
      response = controller.send(command, args)
    end

    puts response if response
  rescue Exception => e
    puts e
  end
  
end

puts 'Domo arigato mr roboto'
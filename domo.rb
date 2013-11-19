Dir["./lib/*.rb"].each {|file| require file }

puts 'Robot Code Kata'
puts '================'
puts 'Commands are: - PLACE X,Y,DIRECTION'
puts '              - LEFT'
puts '              - RIGHT'
puts '              - MOVE'
puts '              - CLEAN'
puts '              - REPORT'
puts 'A blank empty line will quit the program'


def is_quit(input)
  input.empty?
end

def read_table_size
  table_size_raw = File.read("table_size.txt")
  Position.from_str(table_size_raw)
end

def read_dirt_positions
  positions_raw = []
  File.foreach("dirt_positions.txt") { |line| positions_raw << line }
  positions_raw.map {|raw_position| Position.from_str(raw_position) }
end

table = Table.new(read_table_size)
table.place_dirt(read_dirt_positions)
controller = RobotController.new(table)

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
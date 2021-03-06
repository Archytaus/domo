Toy Robot Kata
==============

This is my implementation of the toy robot kata, driven out with TDD

Rules
-----
You have a toy robot that roams around a table top. 
He responds to a series of commands, that for the time being can be methods on a class.

Your toy robot has 5 commands that it can accept:
* Place(x, y, direction_facing)
 * Places the robot at the position X, Y and facing either North, South, East, or West
 * If the robot has already been placed, another place command can be called to place the robot at the new location

* Move
 * Moves the robot forward in the direction they are facing by 1.

* Left 
 * Rotates the robot 90 degrees to the left without changing the position of the robot

* Right
 * Rotates the robot 90 degrees to the right without changing the position of the robot

* Report 
 * Announces the X, Y and facing direction of the robot (for now this can just be output to a commandline or equivilent)


In addition to these commands the robot must: 
* Exists on a table between the positions [0,0] and [10, 10]
* If the robot tries to move into an invalid position they will remain where they are
* The robot can have other commands called before the 'place' command, however they are ignored
* Invalid 'place' commands are ignored (e.g. outside the table, invalid direction)
* The 'report' command must return 'INVALID ROBOT PLACEMENT', or a varient of it, if the robot hasn't been placed yet.
* Commands are read in through a file or stdin

More conditions and rules will be added as the implementation is fleshed out.

Prerequisits
------------
* Ruby 2
* Bundler Gem (`gem install bundler`)

Running
-------
`bundle install`

`rake test`

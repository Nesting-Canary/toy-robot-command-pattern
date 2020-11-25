require "toy_robot/version"
require "toy_robot/client"
require "toy_robot/toy_robot_game"
require "toy_robot/flat_land"
require "toy_robot/command"

module ToyRobot
  class ToyRobot
    attr_reader :position, :direction
    attr_writer :position

    def initialize
      @position = nil
      @direction = nil
    end

    def direction= code
      lookup = {'N' => :north, 'S' => :south, 'E' => :east, 'W' => :west}

      @direction = lookup[code]
    end
  end
end

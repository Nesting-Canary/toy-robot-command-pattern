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
      @lookup = {'N' => :north, 'S' => :south, 'E' => :east, 'W' => :west}
    end

    def direction= code
      @direction = @lookup[code]
    end

    def place(x, y, code)
      return unless !@lookup[code].nil?

      @position = [x,y]
      self.direction = code
    end

    def move
      if (@direction == :north)
        @position[1] += 1
      elsif (@direction == :south)
        @position[1] -= 1
      elsif (@direction == :east)
        @position[0] += 1
      elsif (@direction == :west)
        @position[0] -= 1
      end
    end

  end
end

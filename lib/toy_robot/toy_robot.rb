require "toy_robot/version"
require "toy_robot/client"
require "toy_robot/toy_robot_game"
require "toy_robot/flat_land"
require "toy_robot/command"

module ToyRobot
  class ToyRobot
    attr_reader :position, :direction

    def initialize
      @position = nil
      @direction = nil
      @lookup = {'N' => :north, 'E' => :east, 'S' => :south, 'W' => :west}
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

    def left
      return unless !(position.nil? && direction.nil?)

      directions = @lookup.values
      index = directions.find_index(@direction)
      @direction = directions[index - 1]
    end

    def right
      return unless !(position.nil? && direction.nil?)

      directions = @lookup.values
      index = directions.find_index(@direction)

      return @direction = directions[index + 1] unless index == 3

      @direction = directions[0]
    end

    def report
      "Position: #{@position} Direction: #{@direction}"
    end

    private

    def direction= code
      @direction = @lookup[code]
    end

  end
end

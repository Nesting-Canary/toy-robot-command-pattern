require 'toy_robot/toy_robot'

module ToyRobot
  class ToyRobotGame
    attr_reader :toy_robot, :flat_land

    def initialize (toy_robot, flat_land = nil)
      @toy_robot = toy_robot
      @flat_land = flat_land
    end

    def build_flat_land(width = 5, height = 5)
      unless (width.is_a? Numeric) && (height.is_a? Numeric)
        raise "Can't build flat land, expected a number but got '#{width}' '#{height}'"
      end

      unless width > 0 && height > 0
        raise "Can't build flat land, width and height must be greater than 0"
      end


      @flat_land = FlatLand.new(width, height)
    end

    def place(x = 0, y = 0, direction = 'N')
      return unless !flat_land.nil? && flat_land.isValid?(x, y)

      toy_robot.place(x, y, direction)
    end

    def move
      toy_robot.move
    end

    def left
      toy_robot.left
    end

    def right
      toy_robot.right
    end
  end
end

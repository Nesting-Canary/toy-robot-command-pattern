require 'toy_robot/toy_robot'

module ToyRobot
  class ToyRobotGame
    attr_reader :toy_robot, :flat_land
    #used for testing only
    attr_writer :flat_land

    def initialize (toy_robot)
      @toy_robot = toy_robot
    end

    def build_flat_land(width = 5, height = 5)
      @flat_land = FlatLand.build_flat_land(width, height)
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

    def report
      toy_robot.report
    end
  end
end

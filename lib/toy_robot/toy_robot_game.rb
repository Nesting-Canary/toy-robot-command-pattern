module ToyRobot
  class ToyRobotGame
    attr_reader :toy_robot

    def initialize (toy_robot)
      @toy_robot = toy_robot
    end

    def build_flat_land(width = 5, height = 5)
      unless (width.is_a? Numeric) && (height.is_a? Numeric)
        raise "Can't build flat land, expected a number but got '#{width}' '#{height}'"
      end

      unless width > 0 && height > 0
        raise "Can't build flat land, width and height must be greater than 0"
      end


      FlatLand.new(width, height)
    end
  end
end

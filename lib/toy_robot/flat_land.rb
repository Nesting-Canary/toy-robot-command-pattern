module ToyRobot
  class FlatLand
    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end

    def self.build_flat_land(width = 5, height = 5)
      unless (width.is_a? Numeric) && (height.is_a? Numeric)
        raise "Can't build flat land, expected a number but got '#{width}' '#{height}'"
      end

      unless width > 0 && height > 0
        raise "Can't build flat land, width and height must be greater than 0"
      end


      @flat_land = FlatLand.new(width, height)
    end

    def isValid?(x, y)
       (0...@width).cover?(x) && (0...@height).cover?(y)
    end
  end
end

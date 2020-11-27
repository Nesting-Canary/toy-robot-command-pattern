module ToyRobot
  class FlatLand
    attr_reader :width, :height

    def initialize(width, height)
      @width = width
      @height = height
    end

    def isValid?(x, y)
       (0...@width).cover?(x) && (0...@height).cover?(y)
    end
  end
end

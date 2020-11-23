module ToyRobot
  class Command

    attr_reader :name, :args, :receiver

    def initialize(name, args, receiver)
      @name = name
      @args = args
      @receiver = receiver
    end

  end
end

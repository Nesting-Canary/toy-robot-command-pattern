module ToyRobot
  class Command
    attr_reader :id, :name, :args, :receiver

    def initialize(id, name, *args, receiver)
      @id = id
      @name = name
      @args = *args
      @receiver = receiver
    end

    def execute
      {self => [:success, receiver.send(name, *args)]}
    end

    def hash
      @id.hash ^ @name.hash ^ @args.hash ^ @receiver.hash
    end

    def ==(other)
      @id == other.id &&
      @name == other.name &&
      @args == other.args &&
      @receiver == other.receiver
    end

  end
end

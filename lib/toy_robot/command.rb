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
      result = receiver.send(name, *args)
      isSuccessful = :fail

     isSuccessful = :success unless result.nil?


      [isSuccessful, result]
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

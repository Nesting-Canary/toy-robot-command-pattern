module ToyRobot
  class Client
    def process(input, receiver)
      args = []
      input.split(',').each { |item| args << item.to_i }

      Command.new(:build_flat_land, args, receiver)
    end
  end
end

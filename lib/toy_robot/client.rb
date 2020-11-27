module ToyRobot
  class Client
    # todo: Consider moving the parsing input to the command object, i.e builder pattern
    # todo: Add HEREDOC
    # Design decision: Decided to decouple the incoming command from the method call name by
    # define the symbol :left rather than just create a symbol from the string 'LEFT'. This way
    # the incoming command could be 'TURN LEFT' while the method name still mapped to :left.
    #
    # Design decision: Created a nil command object rather than raise and error. This is due to the requirement
    # to continue processing commands even if an invalid command is found. Building resilience into the application.
    #
    # Design decision: Could have created a builder method on the Command object to construct new Commands from input string, but
    # decided to follow the strict definition for the command pattern, that the Client constructs commands and links them to their
    # receivers as described here: http://www.blackwasp.co.uk/Command.aspx
    #
    # Design decision: Multiple game instances can be running at a time. This is because the command objects contain a receiver
    # object to execute the command on (can be any game instance). The results from execute also store the result against the
    # command to support multiple game instances. Wasn't much extra effort to do this. 
    def build_command(input, receiver)
      args = []
      input = input.upcase.strip

      if(input.match?(/\A(\d+),(\d+)/))
        matchdata = input.match(/\A(\d+),(\d+)/)
        matchdata.captures.each { |match| args << match.to_i }

        command = :build_flat_land
      elsif(input.match?(/\APLACE (\d+),(\d+),([NSEW])/))
        matchdata = input.match(/\APLACE (\d+),(\d+),([NSEW])/)
        args << matchdata[0].to_i
        args << matchdata[1].to_i
        args << matchdata[3]

        command = :place
      elsif(input == "PLACE")
        command = :place
        args = [0,0,'N']
      elsif(input.match?(/\AMOVE/))
        command = :move
      elsif(input.match?(/\ALEFT/))
        command = :left
      elsif(input.match?(/\ARIGHT/))
        command = :right
      elsif(input.match?(/\AREPORT/))
        command = :report
      else
        command = :nil_command
      end

      #TODO refactor to use an ID generator to ensure uniqueness
      Command.new(1, command, *args, receiver)
    end

    def execute(commands)
      results = Hash.new
      commands.each { |command| results[command] = command.execute}

      results
    end
  end
end

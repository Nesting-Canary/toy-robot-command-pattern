describe ToyRobot::Command do
  context 'execute command' do
    it 'succeeds' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      command = ToyRobot::Command.new 1, :build_flat_land, 5,5, game

      result = command.execute

      expect(result[command][0]).to eq(:success)
      expect(result[command][1].flat_land.width).to eq(5)
      expect(result[command][1].flat_land.height).to eq(5)
      #TODO: For now we are modifying a single instance of the game, but in the future
      # we may want to keep seperate instance of the game prior to the command call and after.
      # This isn't a requirement yet.
      expect(command.receiver.flat_land.width).to eq(5)
      expect(command.receiver.flat_land.height).to eq(5)
    end

  end

  context 'command can be used as a key' do
    it 'same command instance returns same hash' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      command = ToyRobot::Command.new :build_flat_land, 5, 5, game
      command = ToyRobot::Command.new :build_flat_land, 5, 5, game

      expect(command.hash).to eq(command.hash)
    end

    it 'same command value returns same hash' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game

      expect(commandOne.hash).to eq(commandTwo.hash)
    end

    it 'different command returns different hash' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne.hash).not_to eq(commandTwo.hash)
    end

    it 'same commands with different ids returns different hash' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :place, 0, 0, 'N' , game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne.hash).not_to eq(commandTwo.hash)
    end

    it 'same commands are equal' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game

      expect(commandOne).to eq(commandTwo)
    end

    it 'same command with different ids are not equal' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :place, 0, 0, 'N' , game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne).not_to eq(commandTwo)
    end
  end
end
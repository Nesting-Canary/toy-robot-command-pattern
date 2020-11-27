describe ToyRobot::Command do
  context 'when execute command' do
    it 'succeeds' do
      game = double(ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new)
      command = ToyRobot::Command.new 1, :build_flat_land, 5,5, game

      expect(game).to receive(:send).with(:build_flat_land, 5,5) {"new flat land"}

      result = command.execute

      expect(result[0]).to eq(:success)
      expect(result[1]).to eq("new flat land")
    end

    it 'fails' do
      game = double(ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new)
      command = ToyRobot::Command.new 1, :build_flat_land, 5,5, game

      expect(game).to receive(:send).with(:build_flat_land, 5,5) {nil}

      result = command.execute

      expect(result[0]).to eq(:fail)
      expect(result[1]).to be_nil
    end

  end

  context 'when hashing command' do
    it 'returns same hash for same command instance' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      command = ToyRobot::Command.new :build_flat_land, 5, 5, game

      expect(command.hash).to eq(command.hash)
    end

    it 'returns same hash for different command instance but same values' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game

      expect(commandOne.hash).to eq(commandTwo.hash)
    end

    it 'returns different hash for different command instances and values' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne.hash).not_to eq(commandTwo.hash)
    end

    it 'returns different hash when different ids' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :place, 0, 0, 'N' , game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne.hash).not_to eq(commandTwo.hash)
    end

    it 'returns true when commands are different instances but values are equal' do
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

  context "when equals command" do
    it 'returns true for same command instance' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      command = ToyRobot::Command.new :build_flat_land, 5, 5, game

      expect(command == command).to eq(true)
    end

    it 'returns true for different command instance but same values' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game

      expect(commandOne == commandTwo).to eq(true)
    end

    it 'returns false for different command instances and values' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne == commandTwo).to eq(false)
    end

    it 'returns false when different ids' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :place, 0, 0, 'N' , game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne == commandTwo).to eq(false)
    end

    it 'returns true when commands are different instances but values are equal' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game
      commandTwo = ToyRobot::Command.new 1, :build_flat_land, 5, 5, game

      expect(commandOne == commandTwo).to eq(true)
    end

    it 'returns false when command with different ids' do
      game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new
      commandOne = ToyRobot::Command.new 1, :place, 0, 0, 'N' , game
      commandTwo = ToyRobot::Command.new 2, :place, 0, 0, 'N', game

      expect(commandOne == commandTwo).to eq(false)
  end
  end
end
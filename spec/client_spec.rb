require 'rspec'
require 'spec_helper'

describe ToyRobot::Client do
  subject(:client) {ToyRobot::Client.new}
  game = ToyRobot::ToyRobotGame.new ToyRobot::ToyRobot.new

  context 'when building :build_flat_land command' do
    it 'succeeds' do
      # Passing in game references, as the client could be handling multiple game instances at once
      command = client.build_command("5,5", game)

      expect(command.name).to eq(:build_flat_land)
      expect(command.receiver).to eq(game)
      expect(command.args).to eq([5,5])
    end
  end

  context 'when building :place command' do
    it 'succeeds' do
      # Passing in game references, as the client could be handling multiple game instances at once
      command = client.build_command("PLACE 0,0,N", game)

      expect(command.name).to eq(:place)
      expect(command.receiver).to eq(game)
      expect(command.args).to eq([0,0,"N"])
    end

    it 'succeeds if no args passed' do
      command = client.build_command("PLACE", game)

      expect(command.name).to eq(:place)
      expect(command.receiver).to eq(game)
      expect(command.args).to eq([0,0,"N"])
    end

    it 'fails if does not match command format' do
      command = client.build_command("PLACE 0,0,X", game)

      # Using a nil command, as requirement is to keep processing if an invalid command is found
      # Normally I would raise and error here but this requirement requires a NilCommand object/pattern
      expect(command.name).to eq(:nil_command)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end

    it 'fails if extra whitespace between PLACE and args' do
      command = client.build_command("PLACE   0,0,X", game)

      # Using a nil command, as requirement is to keep processing if an invalid command is found
      # Normally I would raise and error here but this requirement requires a NilCommand object/pattern
      expect(command.name).to eq(:nil_command)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context 'when building :move command' do
    it 'succeeds' do
      command = client.build_command("MOVE", game)

      expect(command.name).to eq(:move)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context 'when building :left command' do
    it 'succeeds' do
      command = client.build_command("LEFT", game)

      expect(command.name).to eq(:left)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context 'when building :right command' do
    it 'succeeds' do
      command = client.build_command("RIGHT", game)

      expect(command.name).to eq(:right)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context 'when building :report command' do
    it 'succeeds' do
      command = client.build_command("REPORT", game)

      expect(command.name).to eq(:report)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context 'when building ALL commands' do
    it 'succeeds if lowercase, converts all commands to uppercase before parsing' do
      command = client.build_command("place 0,0,w", game)

      expect(command.name).to eq(:place)
      expect(command.receiver).to eq(game)
      expect(command.args).to eq([0,0,"W"])
    end

    it 'succeeds if whitespace at front or end of command, strips whitespace before parsing' do
      command = client.build_command(" RIGHT ", game)

      expect(command.name).to eq(:right)
      expect(command.receiver).to eq(game)
      expect(command.args.length).to eq(0)
    end
  end

  context('execute commands') do
    it 'succeeds to execute a single command' do
      command = instance_double("Command")
      expect(command).to receive(:execute) {[:success, game]}

      results = client.execute([command])
      expect(results[command][0]).to eq(:success)
      expect(results[command][1]).to eq(game)
    end

    it 'succeeds to execute multiple commands' do
      command = double(ToyRobot::Command)
      commandTwo = double(ToyRobot::Command)
      expect(command).to receive(:execute) {[:success, game]}
      expect(commandTwo).to receive(:execute) {[:fail, game]}

      results = client.execute([command, commandTwo])
      expect(results.length).to eq(2)
      expect(results[command][0]).to eq(:success)
      expect(results[command][1]).to eq(game)
      expect(results[commandTwo][0]).to eq(:fail)
      expect(results[commandTwo][1]).to eq(game)
    end

  end
end
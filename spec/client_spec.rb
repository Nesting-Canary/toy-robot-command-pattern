require 'rspec'
require 'spec_helper'

describe ToyRobot::Client do
  subject {ToyRobot::Client.new}
  let (:game) {instance_double(ToyRobot::ToyRobot.new)}

  context 'when process initialises game command' do
    it 'succeeds' do
      # Passing in game references, as the client could be handling multiple game instances at once
      command = subject.process("5,5", :game)

      expect(command.name).to eq(:build_flat_land)
      expect(command.receiver).to eq(:game)
      expect(command.args).to eq([5,5])
    end
  end

  context 'when processing PLACE command' do
    it 'succeeds' do
      # Passing in game references, as the client could be handling multiple game instances at once
      command = subject.process("PLACE 0,0,N", :game)

      pending "Need to implement the following"
      expect(command.name).to eq(:place)
      expect(command.receiver).to eq(:game)
      expect(command.args).to eq([0,0,:north])
    end

    it 'fails' do
      skip 'Not implemented'
    end
  end

  context 'when processing MOVE command' do
    it 'succeeds' do
      skip 'Not implemented'
    end

    it 'fails' do
      skip 'Not implemented'
    end
  end
end
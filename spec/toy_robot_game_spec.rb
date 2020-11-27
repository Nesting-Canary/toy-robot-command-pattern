require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobotGame do
  context 'when initializing a game' do
    toy_robot = ToyRobot::ToyRobot.new
    subject(:game) { ToyRobot::ToyRobotGame.new toy_robot }

    it 'sets the toy_robot field' do
      expect(game.toy_robot).to eq(toy_robot)
      expect(game.flat_land).to be_nil #passing in flat_land to initializer only required for testing
    end
  end

  context 'when building flat_land' do
    toy_robot =  ToyRobot::ToyRobot.new
    subject(:game) { ToyRobot::ToyRobotGame.new toy_robot }

    it 'succeeds to call build_flat_land on FlatLand' do
      flat_land = class_double(ToyRobot::FlatLand)
      game = ToyRobot::ToyRobotGame.new toy_robot, flat_land

      expect(flat_land).to receive(:build_flat_land).with(5,5) {"a new flat_land"}

      result = game.build_flat_land

      expect(result).to eq("a new flat_land")
    end

    it 'succeeds to create FlatLand' do
      expect(game.flat_land).to be_nil

      result = game.build_flat_land(10,12)

      expect(result).to eq(game.flat_land)
      expect(game.flat_land.width).to eq(10)
      expect(game.flat_land.height).to eq(12)
    end

  end

  context 'when executing place command' do
    subject(:toy_robot) { double("ToyRobot::ToyRobot.new") }
    subject(:flat_land) { double("ToyRobot::FlatLand.new(5,5)") }
    subject(:game) { ToyRobot::ToyRobotGame.new(toy_robot, flat_land) }

    it 'succeeds' do
      expect(flat_land).to receive(:nil?) {false}
      expect(flat_land).to receive(:isValid?).with(0,0) {true}
      expect(toy_robot).to receive(:place).with(0,0,'N')

      game.place(0, 0, 'N')
    end

    it 'succeeds when using default args' do
      expect(flat_land).to receive(:nil?) {false}
      expect(flat_land).to receive(:isValid?).with(0,0) {true}
      expect(toy_robot).to receive(:place).with(0,0,'N')

      game.place
    end

    it 'fails if flat_land is not built' do
      expect(flat_land).to receive(:nil?) {true}
      expect(flat_land).not_to receive(:isValid?).with(0,0)
      expect(toy_robot).not_to receive(:place).with(0,0,'N')

      game.place
    end

    it 'fails if position is invalid' do
      expect(flat_land).to receive(:nil?) {false}
      expect(flat_land).to receive(:isValid?).with(-1,0) {false}
      expect(toy_robot).not_to receive(:place).with(-1,0,'N')

      game.place(-1,0,'N')
    end

  end

  context 'when executing move command' do
    it 'succeeds' do
      toy_robot = double(ToyRobot::ToyRobot.new)
      game = ToyRobot::ToyRobotGame.new toy_robot

      expect(toy_robot).to receive(:move)

      game.move
    end
  end

  context 'when executing left command' do
    it 'succeeds' do
      toy_robot = double(ToyRobot::ToyRobot.new)
      game = ToyRobot::ToyRobotGame.new toy_robot

      expect(toy_robot).to receive(:left)

      game.left
    end
  end

  context 'when executing right command' do
    it 'succeeds' do
      toy_robot = double(ToyRobot::ToyRobot.new)
      game = ToyRobot::ToyRobotGame.new toy_robot

      expect(toy_robot).to receive(:right)

      game.right
    end
  end

  context 'when executing report command' do
    it 'succeeds' do
      toy_robot = double(ToyRobot::ToyRobot.new)
      game = ToyRobot::ToyRobotGame.new toy_robot

      expectedReturnValue = "Reporting on this"
      expect(toy_robot).to receive(:report) { expectedReturnValue }

      result = game.report

      expect(result).to eq(expectedReturnValue)
    end
  end
end
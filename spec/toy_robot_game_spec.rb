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

    it 'uses width and height' do
      game.build_flat_land(10, 10)

      expect(game.flat_land.width).to eq(10)
      expect(game.flat_land.height).to eq(10)
    end

    it 'uses default width and height' do
      game.build_flat_land

      expect(game.flat_land.width).to eq(5)
      expect(game.flat_land.height).to eq(5)
    end

    it 'fails when width is below minimum' do
      expect{game.build_flat_land(0,3)}.to raise_error("Can't build flat land, width and height must be greater than 0")
      expect(game.flat_land).to be_nil
    end

    it 'fails when height is below minimum' do
      expect{game.build_flat_land(3,0)}.to raise_error("Can't build flat land, width and height must be greater than 0")
      expect(game.flat_land).to be_nil
    end

    it 'fails when width in non numeric' do
      expect{game.build_flat_land('z',3)}.to raise_error("Can't build flat land, expected a number but got 'z' '3'")
      expect(game.flat_land).to be_nil
    end

    it 'fails when height it non numeric' do
      expect{game.build_flat_land(3,"abc")}.to raise_error("Can't build flat land, expected a number but got '3' 'abc'")
      expect(game.flat_land).to be_nil
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
      expect(toy_robot).to receive(:place).with(0,0,'N')

      game.build_flat_land(5, 5)
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
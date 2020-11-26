require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobotGame do
  toy_robot = ToyRobot::ToyRobot.new
  subject { ToyRobot::ToyRobotGame.new toy_robot }

  # TODO refactor to NOT return game instance, as we don't use this feature (may use this for event sourced pattern,
  # immutable state option)
  context 'constructing a game' do
    it 'succeeds in constructing game with robot dependency' do
      expect(subject.toy_robot).to eq(toy_robot)
    end
  end

  context 'when initialising the game' do
    before (:each) do
      toy_robot = ToyRobot::ToyRobot.new
      subject { ToyRobot::ToyRobotGame.new toy_robot }
    end

    it 'succeeds when 5,5 default passed in' do
      subject.build_flat_land(5, 5)

      expect(subject.flat_land.width).to eq(5)
      expect(subject.flat_land.height).to eq(5)
    end

    it 'succeeds when no values passed in, reverts to default: 5,5' do
      subject.build_flat_land

      expect(subject.flat_land.width).to eq(5)
      expect(subject.flat_land.height).to eq(5)
    end

    it 'succeeds when other valid option passed in, 1,1' do
      game = subject.build_flat_land(1,3)

      expect(subject.flat_land.width).to eq(1)
      expect(subject.flat_land.height).to eq(3)
    end

    it 'fails when x is below minimum of 1 ' do
      expect{subject.build_flat_land(0,3)}.to raise_error("Can't build flat land, width and height must be greater than 0")
    end

    it 'fails when y is below minimum of 1' do
      expect{subject.build_flat_land(3,0)}.to raise_error("Can't build flat land, width and height must be greater than 0")
    end

    it 'fails due to non numeric x' do
      expect{subject.build_flat_land('z',3)}.to raise_error("Can't build flat land, expected a number but got 'z' '3'")
    end

    it 'fails due to non numeric y' do
      expect{subject.build_flat_land(3,"abc")}.to raise_error("Can't build flat land, expected a number but got '3' 'abc'")
    end
  end

  context 'PLACE command' do
    before (:each) do
      toy_robot = ToyRobot::ToyRobot.new
      subject { ToyRobot::ToyRobotGame.new toy_robot }
    end

    it 'succeeds when placing command' do
      subject.build_flat_land(5, 5)
      subject.place(0, 0, 'N')

      expect(subject.toy_robot.position).to eq([0,0])
      expect(subject.toy_robot.direction).to eq(:north)
    end

    it 'succeeds when placing command using default args' do
      subject.build_flat_land(5, 5)
      subject.place

      expect(subject.toy_robot.position).to eq([0,0])
      expect(subject.toy_robot.direction).to eq(:north)
    end

    it 'no change to game when PLACE command BEFORE initialise' do
      subject.place

      expect(subject).to eq(subject)
      expect(subject.flat_land).to be_nil
      expect(subject.toy_robot.position).to be_nil
      expect(subject.toy_robot.direction).to be_nil
    end

    it 'fails if direction is invalid' do
      skip 'Not implemented'
    end

    it 'fails if position is invalid' do
      skip 'Not implemented'
    end
  end

  context 'MOVE command' do
    it 'succeeds when MOVE' do
      subject.build_flat_land(5, 5)
      subject.place

      subject.move

      expect(subject).to eq(subject)
      expect(subject.toy_robot.position).to eq([0, 1])
      expect(subject.toy_robot.direction).to eq(:north)
    end

    it 'no change when MOVE BEFORE initialise' do
      skip 'Not implemented'
    end

    it 'no change when MOVE BEFORE PLACE' do
      skip 'Not implemented'
    end
  end

  context 'LEFT command' do

  end

  context 'RIGHT command' do

  end
end
require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobotGame do
  let(:toy_robot) { instance_double(ToyRobot.new) }
  subject { ToyRobot::ToyRobotGame.new :toy_robot }

  context 'constructing a game' do
    it 'succeeds in constructing game with robot dependency' do
      expect(subject.toy_robot).to eq(:toy_robot)
    end
  end

  context 'when initialising the game' do
    it 'succeeds when 5,5 default passed in' do
      flat_land = subject.build_flat_land(5, 5)

      expect(flat_land.width).to eq(5)
      expect(flat_land.height).to eq(5)
    end

    it 'succeeds when no values passed in, reverts to default: 5,5' do
      flat_land = subject.build_flat_land

      expect(flat_land.width).to eq(5)
      expect(flat_land.height).to eq(5)
    end

    it 'succeeds when other valid option passed in, 1,1' do
      flat_land = subject.build_flat_land(1,3)

      expect(flat_land.width).to eq(1)
      expect(flat_land.height).to eq(3)
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
end
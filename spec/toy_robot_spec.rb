require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobot do
  context 'construction' do
    it "has a version number" do
      expect(ToyRobot::VERSION).not_to be_nil
    end

    it "Construct a new ToyRobot instance" do
      expect(ToyRobot::ToyRobot.new != nil)
    end

    it 'Initialise position and direction to nil' do
      toy_robot = ToyRobot::ToyRobot.new

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end
  end

  context 'instance variables' do
    it 'Set position and direction' do
      toy_robot = ToyRobot::ToyRobot.new
      toy_robot.position = [0,0]
      toy_robot.direction = 'N'

      expect(toy_robot.position).to eq([0,0])
      expect(toy_robot.direction).to eq(:north)
    end

    # Should not place the position if direction is invalid
    #
    # Design decision:This can be executed by having the place command
    # on ToyRobot restrict this OR the ToyRobotGame could enforce it.
    it 'fail to set position if invalid direction' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.place(0, 0, 'x')

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fail to set the direction if position is invalid' do
      skip 'To implement'
    end
  end

  context 'commands' do
    before(:each) do
      @toy_robot = ToyRobot::ToyRobot.new
      @toy_robot.position = [0,0]
      @toy_robot.direction = 'N'
    end

    it 'move increments y when facing :north' do
      @toy_robot.move

      expect(@toy_robot.position).to eq([0,1])
      expect(@toy_robot.direction).to eq(:north)
    end

    it 'move decrements y when facing :south' do
      @toy_robot.direction = 'S'

      @toy_robot.move

      expect(@toy_robot.position).to eq([0,-1])
      expect(@toy_robot.direction).to eq(:south)
    end

    it 'move increments x when facing :east' do
      @toy_robot.direction = 'E'

      @toy_robot.move

      expect(@toy_robot.position).to eq([1,0])
      expect(@toy_robot.direction).to eq(:east)
    end

    it 'move decrements x when facing :west' do
      @toy_robot.direction = 'W'

      @toy_robot.move

      expect(@toy_robot.position).to eq([-1,0])
      expect(@toy_robot.direction).to eq(:west)
    end

    it 'places robot' do
      @toy_robot.place(2, 2, 'S')

      expect(@toy_robot.position).to eq([2,2])
      expect(@toy_robot.direction).to eq(:south)
    end
  end
end

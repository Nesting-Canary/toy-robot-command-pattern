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

  context 'commands' do
    before(:each) do
      @toy_robot = ToyRobot::ToyRobot.new
      @toy_robot.place(0,0, 'N')
    end

    it 'move increments y when facing :north' do
      @toy_robot.move

      expect(@toy_robot.position).to eq([0,1])
      expect(@toy_robot.direction).to eq(:north)
    end

    it 'move decrements y when facing :south' do
      @toy_robot.place(0,0,'S')

      @toy_robot.move

      expect(@toy_robot.position).to eq([0,-1])
      expect(@toy_robot.direction).to eq(:south)
    end

    it 'move increments x when facing :east' do
      @toy_robot.place(0,0,'E')

      @toy_robot.move

      expect(@toy_robot.position).to eq([1,0])
      expect(@toy_robot.direction).to eq(:east)
    end

    it 'move decrements x when facing :west' do
      @toy_robot.place(0,0,'W')

      @toy_robot.move

      expect(@toy_robot.position).to eq([-1,0])
      expect(@toy_robot.direction).to eq(:west)
    end

    it 'left rotates the toy robot one position left, rotates to the end of the list at beginning' do
      # Luckily ruby out of the box behaviour is to have a -1 index go to the end of the array. No extra
      # code required.. #weloveruby
      @toy_robot.place(0,0,'N')

      @toy_robot.left

      expect(@toy_robot.direction).to eq(:west)
    end

    it 'left does not exceed array index minimum and rotates to end of list' do
      @toy_robot.left
    end

    it 'right rotates the toy robot one position right' do
      @toy_robot.right

      expect(@toy_robot.direction).to eq(:east)
    end

    it 'right does not exceed array index mamimum and rotates to start of list' do
      @toy_robot.place(0,0, 'W')

      @toy_robot.right

      expect(@toy_robot.direction).to eq(:north)
    end

    it 'places robot' do
      @toy_robot.place(2, 2, 'S')

      expect(@toy_robot.position).to eq([2,2])
      expect(@toy_robot.direction).to eq(:south)
    end

    it 'fail to set position if invalid direction' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.place(0, 0, 'x')

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fails to MOVE if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.move

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fails to LEFT if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.left

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fails to RIGHT if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.right

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'reports the current position and direction' do
      @toy_robot.place(2, 3, 'W')

      location = @toy_robot.report

      expect(location).to eq("Position: [2, 3] Direction: west")
    end
  end
end

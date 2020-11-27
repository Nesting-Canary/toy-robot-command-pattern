require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobot do
  context 'when constructing' do
    it "has a version number" do
      expect(ToyRobot::VERSION).not_to be_nil
    end

    it 'initialise position, direction to nil and directions to map' do
      toy_robot = ToyRobot::ToyRobot.new

      expectedDirections = {'N' => :north, 'E' => :east, 'S' => :south, 'W' => :west}

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
      expect(toy_robot.directions).to eq(expectedDirections)
    end
  end

  context 'when executing place command' do
    subject(:toy_robot) { ToyRobot::ToyRobot.new }

    it 'succeeds in placing robot at a position and facing a direction' do
      toy_robot.place(2, 2, 'S')

      expect(toy_robot.position).to eq([2,2])
      expect(toy_robot.direction).to eq(:south)
    end

    it 'fails to set position if invalid direction' do
      toy_robot.place(0, 0, 'x')

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fails to set direction if x is nil' do
      toy_robot.place(nil, 1, 'N')

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

    it 'fails to set direction if y is nil' do
      toy_robot.place(1, nil, 'N')

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end
  end

  context 'when executing move command' do
    subject(:toy_robot) { ToyRobot::ToyRobot.new }

    it 'it increments y when facing :north' do
      toy_robot.place(0,0,'N')

      toy_robot.move

      expect(toy_robot.position).to eq([0,1])
      expect(toy_robot.direction).to eq(:north)
    end

    it 'it decrements y when facing :south' do
      toy_robot.place(0,0,'S')

      toy_robot.move

      expect(toy_robot.position).to eq([0,-1])
      expect(toy_robot.direction).to eq(:south)
    end

    it 'it increments x when facing :east' do
      toy_robot.place(0,0,'E')

      toy_robot.move

      expect(toy_robot.position).to eq([1,0])
      expect(toy_robot.direction).to eq(:east)
    end

    it 'it decrements x when facing :west' do
      toy_robot.place(0,0,'W')

      toy_robot.move

      expect(toy_robot.position).to eq([-1,0])
      expect(toy_robot.direction).to eq(:west)
    end

    it 'fails to MOVE if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.move

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

  end

  context "when executing left command" do
    subject(:toy_robot) { ToyRobot::ToyRobot.new }

    it 'it rotates the toy robot to face :west from :north position' do
      toy_robot.place(0,0,'N')

      toy_robot.left

      expect(toy_robot.direction).to eq(:west)
    end

    it 'it rotates the toy robot to face :south from :west position' do
      toy_robot.place(0,0,'W')

      toy_robot.left

      expect(toy_robot.direction).to eq(:south)
    end

    it 'fails to rotate the toy robot left if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.left

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

  end

  context 'when executing right command' do
    subject(:toy_robot) { ToyRobot::ToyRobot.new }

    it 'it rotates the toy robot to face :east from :north position' do
      toy_robot.place(0,0,'N')

      toy_robot.right

      expect(toy_robot.direction).to eq(:east)
    end

    it 'it rotates the toy robot to face :north from :west position' do
      toy_robot.place(0,0, 'W')

      toy_robot.right

      expect(toy_robot.direction).to eq(:north)
    end

    it 'fails to rotate the toy robot right if direction and position not set' do
      toy_robot = ToyRobot::ToyRobot.new

      toy_robot.right

      expect(toy_robot.position).to be_nil
      expect(toy_robot.direction).to be_nil
    end

  end

  context "when report command executed" do
    subject(:toy_robot) { ToyRobot::ToyRobot.new }

    it 'reports the current position and direction' do
      toy_robot.place(2, 3, 'W')

      location = toy_robot.report

      expect(location).to eq("Position: [2, 3] Direction: west")
    end

    it 'fails to report the current position and direction if not set' do
      location = toy_robot.report

      expect(location).to be_nil
    end
  end
end

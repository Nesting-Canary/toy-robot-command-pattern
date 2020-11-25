require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobot do
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

  it 'Set position and direction' do
    toy_robot = ToyRobot::ToyRobot.new
    toy_robot.position = [0,0]
    toy_robot.direction = 'N'

    expect(toy_robot.position).to eq([0,0])
    expect(toy_robot.direction).to eq(:north)
  end
end

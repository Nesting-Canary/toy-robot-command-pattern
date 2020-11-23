require 'rspec'
require 'spec_helper'

describe ToyRobot::ToyRobot do
  it "has a version number" do
    expect(ToyRobot::VERSION).not_to be nil
  end

  it "Construct a new ToyRobot instance" do
    expect(ToyRobot::ToyRobot.new != nil)
  end
end

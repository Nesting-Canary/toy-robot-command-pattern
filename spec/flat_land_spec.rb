require 'rspec'
require 'spec_helper'

describe ToyRobot::FlatLand do
  it 'fails to PLACE when place x coordinate exceeds maximum' do
    flat_land = ToyRobot::FlatLand.new(5,5)

    expect(flat_land.isValid?(5, 0)).to eq(false)
  end

  it 'fails to place when place x coordinate below minimum' do
    flat_land = ToyRobot::FlatLand.new(5,5)

    expect(flat_land.isValid?(-1, 0)).to eq(false)
  end

  it 'fails to place when y coordinate exceeds maximum' do
    flat_land = ToyRobot::FlatLand.new(5,5)

    expect(flat_land.isValid?(0, 5)).to eq(false)
  end

  it 'fails to place when y coordinate below minimum' do
    flat_land = ToyRobot::FlatLand.new(5,5)

    expect(flat_land.isValid?(0, -1)).to eq(false)
  end

end

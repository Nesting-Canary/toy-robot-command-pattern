require 'rspec'
require 'spec_helper'

describe ToyRobot::FlatLand do

  context 'when flat_land is initialized' do
    it 'sets the width and height fields' do
      flat_land = ToyRobot::FlatLand.new(5, 6)

      expect(flat_land.width).to eq(5)
      expect(flat_land.height).to eq(6)
    end

  end

  context "when flat_land is valid called" do
    subject(:flat_land) { ToyRobot::FlatLand.new(5,5) }

    it 'returns true when x and y coordinate within limits'do
      expect(flat_land.isValid?(4, 0)).to eq(true)
    end

    it 'returns false when x coordinate exceeds maximum' do
      expect(flat_land.isValid?(5, 0)).to eq(false)
    end

    it 'returns flalse when place x coordinate below minimum' do
      expect(flat_land.isValid?(-1, 0)).to eq(false)
    end

    it 'returns false when y coordinate exceeds maximum' do
      expect(flat_land.isValid?(0, 5)).to eq(false)
    end

    it 'returns false when y coordinate below minimum' do
      expect(flat_land.isValid?(0, -1)).to eq(false)
    end
  end

end

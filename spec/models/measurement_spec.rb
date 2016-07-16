require 'rails_helper'

describe Measurement, :type => :model do
  before do
    @measurement = FactoryGirl.build(:measurement)
  end

  it 'has valid factory' do
    expect(@measurement).to be_valid
  end

  context 'properties' do
    it 'has a weight' do
      expect(@measurement).to respond_to(:weight)
    end
  end

  context 'associations' do
    it 'belongs to an entry' do
      expect(@measurement).to respond_to(:entry)
    end
  end

  context 'validations' do
    it 'requires the presence of weight' do
      @measurement.weight = nil
      expect(@measurement).to have(1).error_on(:weight)
    end

    it 'requires the presence of an entry' do
      @measurement.entry = nil
      expect(@measurement).to have(1).error_on(:entry)
    end
  end
end

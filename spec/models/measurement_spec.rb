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

    it 'has a height' do
      expect(@measurement).to respond_to(:height)
    end

    it 'has a bodyfat' do
      expect(@measurement).to respond_to(:bodyfat)
    end

    'it has a chest measurement' do
      expect(@measurement).to respond_to(:chest)
    end

    it 'has a waist measurement' do
      expect(@measurement).to respond_to(:waist)
    end
  end

  context 'associations' do
    it 'belongs to an entry' do
      expect(@measurement).to respond_to(:entry)
    end
  end

  context 'validations' do
    it 'requires that weight is a number' do
      @measurement.weight = "test"
      expect(@measurement).to have(1).error_on(:weight)
      @measurement.weight = 140.5
      expect(@measurement).to have(0).errors_on(:weight)
    end

    it 'allows weight to be left blank' do
      @measurement.weight = nil
      expect(@measurement).to have(0).errors_on(:weight)
    end

    it 'requires that height is a number' do
      @measurement.height = "test"
      expect(@measurement).to have(1).error_on(:height)
      @measurement.height = 140.5
      expect(@measurement).to have(0).errors_on(:height)
    end

    it 'allows height to be left blank' do
      @measurement.height = nil
      expect(@measurement).to have(0).errors_on(:height)
    end

    it 'requires that bodyfat is a number' do
      @measurement.bodyfat = "test"
      expect(@measurement).to have(1).error_on(:bodyfat)
      @measurement.bodyfat = 140.5
      expect(@measurement).to have(0).errors_on(:bodyfat)
    end

    it 'allows bodyfat to be left blank' do
      @measurement.bodyfat = nil
      expect(@measurement).to have(0).errors_on(:bodyfat)
    end

    it 'requires that chest is a number' do
      @measurement.chest = "test"
      expect(@measurement).to have(1).error_on(:chest)
      @measurement.chest = 140.5
      expect(@measurement).to have(0).errors_on(:chest)
    end

    it 'allows chest to be left blank' do
      @measurement.chest = nil
      expect(@measurement).to have(0).errors_on(:chest)
    end

    it 'requires that waist is a number' do
      @measurement.waist = "test"
      expect(@measurement).to have(1).error_on(:waist)
      @measurement.waist = 140.5
      expect(@measurement).to have(0).errors_on(:waist)
    end

    it 'allows waist to be left blank' do
      @measurement.waist = nil
      expect(@measurement).to have(0).errors_on(:waist)
    end

    it 'requires the presence of an entry' do
      @measurement.entry = nil
      expect(@measurement).to have(1).error_on(:entry)
    end
  end
end

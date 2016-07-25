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
    end

    it 'allows weight to be left blank' do
    end

    it 'requires that heightis a number' do
    end

    it 'allows heightto be left blank' do
    end

    it 'requires that bodyfat is a number' do
    end

    it 'allows bodyfat to be left blank' do
    end

    it 'requires that chest is a number' do
    end

    it 'allows chest to be left blank' do
    end

    it 'requires that waist is a number' do
    end

    it 'allows waist to be left blank' do
    end

    it 'requires the presence of an entry' do
      @measurement.entry = nil
      expect(@measurement).to have(1).error_on(:entry)
    end
  end
end

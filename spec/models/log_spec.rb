require 'rails_helper'

describe Log do

  it 'has valid factory' do
    expect(FactoryGirl.build(:log)).to be_valid
  end

  it 'belongs to a user' do
    log = FactoryGirl.build(:log)
    expect(log).to respond_to(:user)
  end

  context 'day related information' do

    it 'has many days' do
    end

    it 'has a total days passed' do
    end

  end

  context 'measurement related information' do

    it 'has many measurements through days' do
    end

    it 'has a most recent measurement' do
    end

    it 'has a total change in measurements' do
    end

  end

  context 'calculations' do

    it 'has an average weekly change in measurement when attempting to lose' do
    end

    it 'has an average weekly change in measurement when attempting to gain' do
    end

    it 'has an average weekly change in measurement when attempting to maintain' do
    end

    it 'has an average weekly change in measurement overall' do
    end

  end

end

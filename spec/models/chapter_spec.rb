require 'rails_helper'

describe Chapter do

  it 'has valid factory' do
    expect(FactoryGirl.build(:chapter)).to be_valid
  end

  it 'has a goal' do
  end

  context 'date' do

    it 'has a start date' do
    end

    it 'knows the total amount of days passed' do
    end

    it 'stops counting the total amount of days when marked complete' do
    end

  end


  context 'entries' do

    it 'has many entries' do
    end

  end

  context 'measurements' do

    it 'has many measurements through entries' do
    end

    it 'has a most recent measurement' do
    end

    it 'has a total change in measurements' do
    end

  end

end

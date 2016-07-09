require 'rails_helper'

describe Log, :type => :model do

  it 'has valid factory' do
    expect(FactoryGirl.build(:log)).to be_valid
  end

  it 'belongs to a user' do
    log = FactoryGirl.build(:log)
    expect(log).to respond_to(:user)
  end

  context 'chapters' do

    it 'has many chapters' do
    end

    it 'knows the most recent chapter' do
    end

  end

  context 'average calculations' do

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

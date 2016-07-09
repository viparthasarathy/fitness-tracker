require 'rails_helper'

describe Chapter, :type => :model do
  it 'has valid factory' do
    expect(FactoryGirl.build(:chapter)).to be_valid
  end

  context 'properties' do

    before do
      @chapter = FactoryGirl.build(:chapter)
    end

    it 'should respond to goal' do
      expect(@chapter).to respond_to(:goal)
    end

    it 'should belong to a log' do
      expect(@chapter).to respond_to(:log)
    end

    it 'should respond to title' do
      expect(@chapter).to respond_to(:title)
    end
    it 'should respond to description' do
      expect(@chapter).to respond_to(:description)
    end
    it 'should respond to created at' do
      expect(@chapter).to respond_to(:created_at)
    end
    it 'should responded to completed at' do
      expect(@chapter).to respond_to(:completed_at)
    end
    it 'has many entries'
    it 'has many measurements through entries'
  end

  context 'validations' do
    it 'requires the presence of a goal' do
      chapter = FactoryGirl.build(:chapter, goal: nil)
      expect(chapter).to have(1).error_on(:goal)
    end

    it 'requires the presence of a title' do
      chapter = FactoryGirl.build(:chapter, title: nil)
      expect(chapter).to have(1).error_on(:title)
    end
  end

end

require 'rails_helper'

describe Chapter, :type => :model do
  before do
    @chapter = FactoryGirl.build(:chapter)
  end

  it 'has valid factory' do
    expect(@chapter).to be_valid
  end

  context 'properties' do
    it 'responds to goal' do
      expect(@chapter).to respond_to(:goal)
    end

    it 'responds to title' do
      expect(@chapter).to respond_to(:title)
    end

    it 'responds to description' do
      expect(@chapter).to respond_to(:description)
    end

    it 'responds to created at' do
      expect(@chapter).to respond_to(:created_at)
    end

    it 'responds to completed at' do
      expect(@chapter).to respond_to(:completed_at)
    end

    it 'responds to total calories' do
      expect(@chapter).to respond_to(:total_calories)
    end

    it 'responds to total carbs' do
      expect(@chapter).to respond_to(:total_carbs)
    end
    it 'responds to total fats' do
      expect(@chapter).to respond_to(:total_fats)
    end

    it 'responds to total protein' do
      expect(@chapter).to respond_to(:total_protein)
    end
  end

  context 'associations' do
    it 'belongs to a log' do
      expect(@chapter).to respond_to(:log)
    end

    it 'has many entries' do
      expect(@chapter).to respond_to(:entries)
    end

    it 'has many foods through entries' do
      expect(@chapter).to respond_to(:foods)
    end

    it 'has many measurements through entries' do
      expect(@chapter).to respond_to(:measurements)
    end
  end

  context 'validations' do
    it 'requires the presence of a goal' do
      @chapter.goal = nil
      expect(@chapter).to have(2).error_on(:goal)
    end

    it 'requires the presence of a title' do
      @chapter.title = nil
      expect(@chapter).to have(1).error_on(:title)
    end

    it 'requires that goal is a number' do
      @chapter.goal = "I want to be big"
      expect(@chapter).to have(1).error_on(:goal)
    end

    it 'requires the presence of a log' do
      @chapter.log = nil
      expect(@chapter).to have(1).error_on(:log)
    end
  end
end

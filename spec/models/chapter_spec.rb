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

    it 'responds to total calories'
    it 'responds to total carbs'
    it 'responds to total fats'
    it 'responds to total protein'
  end

  context 'associations' do
    it 'belongs to a log' do
      expect(@chapter).to respond_to(:log)
    end

    it 'has many entries'
    it 'has many measurements through entries'
  end

  context 'validations' do
    it 'requires the presence of a goal' do
      chapter = FactoryGirl.build(:chapter, goal: nil)
      expect(chapter).to have(2).error_on(:goal)
    end

    it 'requires the presence of a title' do
      chapter = FactoryGirl.build(:chapter, title: nil)
      expect(chapter).to have(1).error_on(:title)
    end

    it 'requires that goal is a number' do
      chapter = FactoryGirl.build(:chapter, goal: "i wana get huuuge")
      expect(chapter).to have(1).error_on(:goal)
    end
  end

  context 'methods' do
    it 'can calculate the average weekly change in weight' #(total change / days passed [completed_at || Date.today]) * 7
    it 'can calculate the total change in weight' #latest measurement - earliest measurement
    it 'can calculate the average daily consumption of calories' # total calories / entries.count
    it 'can calculate the average daily consumption of carbs' # total carbs / entries.count
    it 'can calculate the average daily consumption of fats' # total fats / entries.count
    it 'can calculate the average daily consumption of protein' # total protein / entries.count
    it 'can estimate the total daily expenditure of energy' # use daily change in weight and daily calorie consumption, +-500/day = 1 lb/week
  end


end

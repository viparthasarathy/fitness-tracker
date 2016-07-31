require 'rails_helper'

describe Entry, :type => :model do
  before do
    @chapter = FactoryGirl.create(:chapter, completed_at: Time.zone.today - 1)
    @entry = FactoryGirl.build(:entry, chapter: @chapter)
  end
  it 'has valid factory' do
    expect(@entry).to be_valid
  end

  context 'properties' do
    it 'responds to day' do
      expect(@entry).to respond_to(:day)
    end

    it 'responds to notes' do
      expect(@entry).to respond_to(:notes)
    end

    it 'responds to total calories' do
      expect(@entry).to respond_to(:total_calories)
    end

    it 'responds to total carbs' do
      expect(@entry).to respond_to(:total_carbs)
    end

    it 'responds to total fats' do
      expect(@entry).to respond_to(:total_fats)
    end

    it 'responds to total protein' do
      expect(@entry).to respond_to(:total_protein)
    end
  end

  context 'associations' do
    it 'belongs to a chapter' do
      expect(@entry).to respond_to(:chapter)
    end

    it 'has many foods' do
      expect(@entry).to respond_to(:foods)
    end

    it 'has one measurement' do
      expect(@entry).to respond_to(:measurement)
    end
  end

  context 'validations' do
    it 'requires the presence of a chapter' do
      @entry.chapter = nil
      expect(@entry).to have(1).error_on(:chapter)
    end

    it 'requires the presence of day' do
      @entry.day = nil
      expect(@entry).to have(1).error_on(:day)
    end

    it 'cannot have a day that is before the parent chapter start date' do
      @entry.day = @chapter.created_at.to_date - 1
      expect(@entry).to have(1).error_on(:day)
    end

    it 'cannot have a day that is after the parent chapter end date' do
      @entry.day = @chapter.completed_at + 1.day
      expect(@entry).to have(1).error_on(:day)
    end

    it 'cannot have a day that is after the current date' do
      @chapter.update(completed_at: Date.current + 2)
      @entry.day = Time.zone.today + 1
      expect(@entry).to have(1).error_on(:day)
    end

    it 'must have a unique day in the context of the chapter' do
      second_entry = FactoryGirl.create(:entry, chapter: @chapter)
      expect(@entry).to have(1).error_on(:day)
    end
  end
end

require 'rails_helper'

describe Log, :type => :model do
  before do
    @log = FactoryGirl.build(:log)
  end

  it 'has valid factory' do
    expect(@log).to be_valid
  end

  context 'properties' do
    it 'responds to created at' do
      expect(@log).to respond_to(:created_at)
    end
  end

  context 'associations' do
    it 'has many chapters' do
      expect(@log).to respond_to(:chapters)
    end

    it 'belongs to a user' do
      expect(@log).to respond_to(:user)
    end

    it 'has many entries through chapters' do
      expect(@log).to respond_to(:entries)
    end
  end

  context 'validations' do
    it 'requires the presence of a user' do
      @log.user = nil
      expect(@log).to have(1).error_on(:user)
    end
  end


  context 'chapter-related methods' do
    before do
      @log.save
      @chapter_one = FactoryGirl.create(:chapter, log: @log, completed_at: Date.current - 3)
      @chapter_one.update(created_at: Time.zone.today - 6)
      @chapter_two = FactoryGirl.create(:chapter, title: "Hey!", log: @log)
    end

    it 'knows its latest chapter' do
      expect(@log.latest_chapter).to eq(@chapter_two)
    end

    it 'knows whether it has a chapter in progress' do
      expect(@log.has_chapter_in_progress?).to eq(true)
      @log.latest_chapter.update(completed_at: Date.current)
      expect(@log.has_chapter_in_progress?).to eq(false)
    end
  end

  context 'entry-related methods' do
    before do
      @log.save
      @chapter = FactoryGirl.create(:chapter, log: @log)
      @earlier_entry = FactoryGirl.create(:entry, chapter: @chapter, day: Time.zone.today - 1)
      @entry = FactoryGirl.create(:entry, chapter: @chapter)
    end

    it 'knows its latest entry' do
      expect(@log.latest_entry).to eq(@earlier_entry)
    end
  end

end

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

    it 'has many entries through chapters' do
      expect(@log).to respond_to(:entries)
    end

    it 'belongs to a user' do
      expect(@log).to respond_to(:user)
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
      @chapter_one = FactoryGirl.create(:chapter, log: @log)
      @chapter_one.update(created_at: Time.zone.today - 10)
      @chapter_two = FactoryGirl.create(:chapter, title: "Hey!", log: @log)
    end

    it 'knows its previous chapter' do
      expect(@log.previous_chapter).to eq(@chapter_one)
    end

    it 'knows whether its previous chapter is still in progress' do
      expect(@log.previous_chapter_in_progress?).to eq(true)
      @log.previous_chapter.update(completed_at: Date.today)
      expect(@log.previous_chapter_in_progress?).to eq(false)
    end
  end

  context 'average calculations' do
    # implement these via angular probably
    it 'has an average weekly change in measurement when attempting to lose'
    it 'has an average weekly change in measurement when attempting to gain'
    it 'has an average weekly change in measurement when attempting to maintain'
    it 'has an average weekly change in measurement overall'
    it 'knows average daily consumption when attempting to lose'
    it 'knows average daily consumption when attempting to gain'
    it 'knows average daily consumption when attempting to maintain'
    it 'has an total daily expenditure of energy estimate'
  end
end

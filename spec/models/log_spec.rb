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
  end

  context 'validations' do
    it 'requires the presence of a user' do
      @log.user = nil
      expect(@log).to have(1).error_on(:user)
    end
  end


  context 'chapter-related methods' do
    before do
      @log = FactoryGirl.create(:log)
      @chapter_one = FactoryGirl.create(:chapter, log: @log, completed_at: Date.current - 3)
      @chapter_two = FactoryGirl.create(:chapter, title: "Hey!", log: @log)
    end

    it 'knows its latest chapter' do
      expect(@log.latest_chapter).to eq(@chapter_two)
    end

    it 'knows whether it has a chapter in progress' do
      expect(@log.has_chapter_in_progress).to eq(true)
      @log.latest_chapter.update(completed_at: Date.current)
      expect(@log.has_chapter_in_progress).to eq(false)
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

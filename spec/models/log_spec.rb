require 'rails_helper'

describe Log, :type => :model do

  it 'has valid factory' do
    expect(FactoryGirl.build(:log)).to be_valid
  end

  context 'properties' do
   before do
     @log = FactoryGirl.build(:log)
   end

    it 'has many chapters' do
      expect(@log).to respond_to(:chapters)
    end

    it 'belongs to a user' do
      expect(@log).to respond_to(:user)
    end

    it 'responds to created at' do
      expect(@log).to respond_to(:created_at)
    end
  end

  context 'chapter-related methods' do
    before do
      @log = FactoryGirl.create(:log)
      @chapter_one = FactoryGirl.create(:chapter, log: @log)
      @chapter_two = FactoryGirl.create(:chapter, title: "Hey!", log: @log)
    end

    it 'knows its previous chapter' do
      expect(@log.previous_chapter).to eq(@chapter_one)
    end

    it 'knows whether it has a chapter in progress' do
      expect(@log.has_chapter_in_progress?).to eq(true)
      @log.previous_chapter.update(completed_at: Date.today)
      expect(@log.has_chapter_in_progress?).to eq(false)
    end
  end

  context 'average calculations' do
    it 'has an average weekly change in measurement when attempting to lose'
    it 'has an average weekly change in measurement when attempting to gain'
    it 'has an average weekly change in measurement when attempting to maintain'
    it 'has an average weekly change in measurement overall'
  end

end

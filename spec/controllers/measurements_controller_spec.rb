require 'rails_helper'

describe MeasurementsController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @chapter = FactoryGirl.create(:chapter, log: @user.log)
    @entry = FactoryGirl.create(:entry, chapter: @chapter)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
  end

  describe 'POST #create' do
    context 'logged in' do
      context 'as owner' do
      end

      context 'as other user' do
      end
    end

    context 'logged out' do
    end

  end

  describe 'PUT #update' do
    context 'logged in' do
      context 'as owner' do
      end

      context 'as other user' do
      end
    end

    context 'logged out' do
    end
  end

end

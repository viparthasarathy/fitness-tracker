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
        it 'returns an error for invalid data'
        it 'succeeds with valid data'
        it 'returns the measurement info on success'
      end

      context 'as other user' do
        it 'raises an authorization error'
      end
    end
 
    context 'logged out' do
      it 'raises a validation error'
    end
  end

  describe 'PUT #update' do
    context 'logged in' do
      context 'as owner' do
        it 'returns an error for invalid data'
        it 'succeeds with valid data'
        it 'updates the value'
        it 'returns the updated measurement info on success'
      end

      context 'as other user' do
        it 'raises an authorization error'
      end
    end

    context 'logged out' do
      it 'raises a validation error'
    end
  end
end

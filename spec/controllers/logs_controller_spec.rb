require 'rails_helper'

describe LogsController do

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'GET #show' do
    it 'assigns the current users log to @log' do
    end

    it 'redirects the user if they are not logged in' do
    end

    it 'returns @log in JSON format' do
    end

    it 'the JSON contains information regarding logs association' do
    end
  end

end

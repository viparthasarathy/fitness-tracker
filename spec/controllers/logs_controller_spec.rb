require 'rails_helper'

describe LogsController, :type => :controller do

  describe 'GET #show' do
    context 'logged in' do
      before do
        @user = FactoryGirl.create(:user)
        @log = @user.log
        @chapter = FactoryGirl.create(:chapter, log: @log)
        sign_in @user
      end

      it 'is a successful request' do
        get :show, :format => :json
        expect(response.status).to eq(200)
      end

      it 'returns the user log' do
        get :show, :format => :json
        log_response = JSON.parse(response.body, symbolize_names: true)
        expect(log_response[:id]).to eq(@user.log.id)
      end

      it 'contains references to the log chapters' do
        get :show, :format => :json
        log_response = JSON.parse(response.body, symbolize_names: true)
        expect(log_response[:chapters][0][:id]).to eq(@user.log.chapters.first.id)
      end
    end

    context 'logged out' do
      it 'raises an unauthorized error' do
        get :show, :format => :json
        expect(response.status).to eq(401)
      end
    end
  end
end

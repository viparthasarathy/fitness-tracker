require 'rails_helper'

describe LogsController do

  describe 'GET #show' do
    context 'logged in' do
      before do
        @user = FactoryGirl.create(:user)
        login_as(@user, :scope => :user)
        get :show, :format => :json
        log_response = JSON.parse(response.body, symbolize_names: true)
      end

      it 'is a successful request' do
        expect(response).to eq(200)
      end

      it 'returns the user log' do
        expect(log_response[:id]).to eq(@user.log.id)
      end

      it 'contains references to the log chapters' do
        get :show, :format => :json
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

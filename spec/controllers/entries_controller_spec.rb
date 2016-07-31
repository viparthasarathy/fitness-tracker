require 'rails_helper'

describe EntriesController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
    @chapter = FactoryGirl.create(:chapter, log: @user.log)
    @entry_params = {chapter_id: @chapter.id, day: Time.zone.today, notes: "These are some notes"}
  end

  describe 'POST #create' do
    context 'logged in' do
      before do
        sign_in @user
      end

      context 'as owner of chapter' do
        it 'fails if sent invalid data and return the error' do
          @entry_params[:day] = Time.zone.today + 1
          post :create, {:format => :json, :entry => @entry_params}
          expect(response.status).to eq(400)
          error_response = JSON.parse(response.body, symbolize_names: true)
          expect(error_response[:day][0]).to eq("cannot come after current day")
        end

        it 'succeeds if sent proper data' do
          post :create, {:format => :json, :entry => @entry_params}
          expect(response.status).to eq(201)
          expect(@chapter.entries.count).to eq(1)
        end

        it 'returns the entry info on success' do
          post :create, {:format => :json, :entry => @entry_params}
          entry_response = JSON.parse(response.body, symbolize_names: true)
          expect(entry_response[:notes]).to eq("These are some notes")
        end
      end
    end

      context 'as other user' do
        before do
          sign_in @other_user
        end

        it 'raises an authorization error' do
          post :create, {:format => :json, :entry => @entry_params}
          expect(response.status).to eq(403)
        end
      end

    context 'logged out' do
      it 'raises an authentication error' do
        post :create, {:format => :json, :entry => @entry_params}
        expect(response.status).to eq(401)
        expect(@chapter.entries.count).to eq(0)
      end
    end
  end

  describe 'GET #show' do
    before do
      @entry = FactoryGirl.create(:entry, chapter: @chapter)
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
          get :show, {:format => :json, :id => @entry.id}
          @entry_response = JSON.parse(response.body, symbolize_names: true)
        end

        it 'is a success' do
          get :show, {:format => :json, :id => @entry.id}
          expect(response.status).to eq(200)
        end

        it 'returns the entry' do
          expect(@entry_response[:id]).to eq(@entry.id)
        end

        it 'contains information regarding its foods' do
          expect(@entry_response).to have_key(:foods)
        end
        it 'contains information regarding its measurement' do
          expect(@entry_response).to have_key(:measurement)
        end
      end

      context 'as other user' do
        before do
          sign_in @other_user
        end

        it 'raises an authorization error' do
          get :show, {:format => :json, :id => @entry.id}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        get :show, {:format => :json, :id => @entry.id}
        expect(response.status).to eq(401)
      end
    end
  end
end

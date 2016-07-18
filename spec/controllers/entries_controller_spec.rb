require 'rails_helper'

describe EntriesController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
    @chapter = FactoryGirl.create(:chapter, log: @user.log)
    @entry_params = {day: Time.zone.today, notes: "These are some notes"}
  end

  describe 'POST #create' do
    describe 'logged in' do
      before do
        sign_in @user
      end

      it 'should fail if sent invalid data and return the error' do
        @entry_params[:day] = Time.zone.today + 1
        post :create, {:format => :json, :id => @chapter.id, :entry => @entry_params}
        expect(response.status).to eq(400)
        error_response = JSON.parse(response.body, symbolize_names: true)
        expect(error_response[:messages][:day]).to eq("cannot come after current day")
      end

      it 'succeeds if sent proper data' do
        post :create, {:format => :json, :id => @chapter.id, :entry => @entry_params}
        expect(response.status).to eq(201)
        expect(@chapter.entries.count).to eq(1)
      end

      it 'returns the entry info on success' do
        post :create, {:format => :json, :id => @chapter.id, :entry => @entry_params}
        entry_response = JSON.parse(response.body, symbolize_names: true)
        expect(chapter_response[:notes).to eq("These are some notes")
      end
    end

    describe 'logged out' do
      it 'raises an unauthorized error' do
        post :create, {:format => :json, :id => @chapter.id, :entry => @entry_params}
        expect(response.status).to eq(401)
        expect(@chapter.entries.count).to eq(0)
      end
    end

end

require 'rails_helper'

describe ChaptersController, :type => :controller do

  describe 'post #CREATE' do
    before do
      @chapter_params = {goal: -1.0, title: "Diet #1", description: "This is my first diet. Yay."}
    end
    context 'logged in' do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
      it 'does not let the user manually set a value for created at or completed at' do
        @chapter_params[:created_at] = "LONG TIME AGO"
        @chapter_params[:completed_at] = "A WHILE BACK"
        post :create, { :format => :json, :chapter => @chapter_params}
        chapter_response = JSON.parse(response.body, symbolize_names: true)
        expect(chapter_response[:created_at]).to_not eq("LONG TIME AGO")
        expect(chapter_response[:completed_at]).to eq(nil)
      end

      it 'does not let the user create a chapter unless they have a completed one' do
        post :create, {:format => :json, :chapter => @chapter_params}
        expect(response.status).to eq(201)
        expect(@user.log.chapters.count).to eq(1)
        @chapter_params[:title] = "Diet #2"
        post :create, {:format => :json, :chapter => @chapter_params}
        expect(@user.log.chapters.count).to eq(1)
        expect(response.status).to eq(403)
      end

      it 'creates a chapter' do
        expect(@user.log.chapters.count).to eq(0)
        post :create, {:format => :json, :chapter => @chapter_params}
        expect(response.status).to eq(201)
        expect(@user.log.chapters.count).to eq(1)
      end
    end

    context 'logged out' do
      it 'raises an unauthorized error' do
        post :create, {:format => :json, :chapter => @chapter_params}
        expect(response.status).to eq(401)
        expect(Chapter.count).to eq(0)
      end
    end
  end

  describe 'get #SHOW' do
    before do
      @user = FactoryGirl.create(:user)
      @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
      @chapter = FactoryGirl.create(:chapter, log: @user.log)
    end
    context 'logged in' do
      context 'belongs to the user' do
        before do
          sign_in @user
        end
        it 'is successful' do
          get :show, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(200)
        end

        it 'returns the chapter' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:id]).to eq(@chapter.id)
        end

        it 'contains references to the chapter entries'
      end

      context 'does not belong to the user' do
        before do
          sign_in @other_user
        end
        it 'raises an authorization error' do
          get :show, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        get :show, {:format => :json, :id => @chapter.id}
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'put #UPDATE' do
    it 'changes the completed at value from nil to the current date for the most recent chapter'
  end
end

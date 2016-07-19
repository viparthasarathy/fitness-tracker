require 'rails_helper'

describe ChaptersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
    @chapter_params = {goal: -1.0, title: "Diet #1", description: "This is my first diet. Yay."}
  end

  describe 'POST #create' do
    context 'logged in' do
      before do
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

  describe 'GET #show' do
    before do
      @chapter = FactoryGirl.create(:chapter, log: @user.log)
      @entry = FactoryGirl.create(:entry, chapter: @chapter)
    end

    context 'logged in' do
      context 'as owner' do
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

        it 'contains references to the chapter entries' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:entries][0][:id]).to eq(@entry.id)
          expect(Date.parse(chapter_response[:entries][0][:day])).to eq(@entry.day)
        end

        it 'contains information regarding its measurements' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:measurements]).to be_an(Array)
        end

        it 'contains information regarding its total calories' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:total_calories]).to eq(@chapter.total_calories)
        end

        it 'contains information regarding its total fats' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:total_fats]).to eq(@chapter.total_fats)
        end

        it 'contains information regarding its total carbs' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:total_carbs]).to eq(@chapter.total_carbs)
          expect(chapter_response[:total_protein]).to eq(@chapter.total_protein)
        end

        it 'contains information regarding its total protein' do
          get :show, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:total_protein]).to eq(@chapter.total_protein)
        end
      end

      context 'as non-owner' do
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

  describe 'PATCH #update' do
    before do
      @chapter = FactoryGirl.create(:chapter, log: @user.log)
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
        end

        it 'is successful' do
          patch :update, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(200)
        end

        it 'returns the chapter with the completed at value filled in' do
          patch :update, {:format => :json, :id => @chapter.id}
          chapter_response = JSON.parse(response.body, symbolize_names: true)
          expect(chapter_response[:id]).to eq(@chapter.id)
          expect(Date.parse(chapter_response[:completed_at])).to eq(Date.today)
        end

        it 'raises an error if the chapter already has a completed at value' do
          patch :update, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(200)
          patch :update, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(403)
        end
      end

      context 'as non-owner' do
        before do
          sign_in @other_user
        end

        it 'raises an authorization error' do
          patch :update, {:format => :json, :id => @chapter.id}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        patch :update, {:format => :json, :id => @chapter.id}
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'GET #index' do
    before do
      FactoryGirl.create(:chapter, log: @user.log, title: "1")
      FactoryGirl.create(:chapter, log: @user.log, title: "2")
      FactoryGirl.create(:chapter, log: @user.log, title: "3")
    end

    context 'logged in' do
      before do
        sign_in @user
      end

      it 'is successful' do
        get :index, {:format => :json }
        expect(response.status).to eq(200)
      end

      it 'returns the users chapters' do
        get :index, {:format => :json }
        chapters_response = JSON.parse(response.body, symbolize_names: true)
        expect(chapters_response.length).to eq(3)
      end

      it 'does not return other users chapters' do
        FactoryGirl.create(:chapter, log: @other_user.log, title: "4")
        get :index, {:format => :json }
        chapters_response = JSON.parse(response.body, symbolize_names: true)
        expect(chapters_response.length).to_not eq(4)
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        get :index, {:format => :json }
        expect(response.status).to eq(401)
      end
    end
  end

end

require 'rails_helper'

describe ChaptersController, :type => :controller do

  describe 'post #CREATE' do
    context 'logged in' do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @chapter_params = {goal: -1.0, title: "Diet #1", description: "This is my first diet. Yay."}
      end

      it 'does not let the user manually set a value for created at or completed at' do
        @chapter_params[:created_at] = "LONG TIME AGO"
        @chapter_params[:completed_at] = "A WHILE BACK"
        post :create, { :format => :json, :chapter => @chapter_params }
        chapter = JSON.parse(response.body, symbolize_names: true)
        expect(chapter.created_at).to_not eq("LONG TIME AGO")
        expect(chapter.completed_at).to eq(nil)
      end

      it 'does not let the user create a chapter unless they have a completed one' do
        post :create, {:format => :json, :chapter => @chapter_params }
        @chapter_params[:title] = "Diet #2"
        post :create, {:format => :json, :chapter => @chapter_params }
        expect(@user.log.chapters.map(:title).to_not include("Diet #2")
      end




    end

    context 'logged out' do

      it 'redirects users and does not create anything'

    end

  end





end

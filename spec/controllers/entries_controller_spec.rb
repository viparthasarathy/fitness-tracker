require 'rails_helper'

describe EntriesController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
    @chapter_params = {goal: -1.0, title: "Diet #1", description: "This is my first diet. Yay."}
  end
end

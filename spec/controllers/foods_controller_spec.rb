require 'rails_helper'

describe FoodsController, :type => :controller do
  before do
    @entry = Entry.create(:entry)
    @user = @entry.user
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
  end

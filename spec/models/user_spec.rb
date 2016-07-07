require 'rails_helper'

describe User do

  it 'has valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'responds to email' do
    user = FactoryGirl.create(:user, email: "me@gmail.com")
    expect(user.email).to eq("me@gmail.com")
  end

  it 'has a log on creation' do
    user = FactoryGirl.create(:user)
    expect(user.log).to be_a(Log)
  end

end

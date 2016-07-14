require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it 'has valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context 'properties' do
    it 'responds to email' do
      expect(@user).to respond_to(:email)
    end

    it 'responds to password' do
      expect(@user).to respond_to(:password)
    end

    it 'responds to time zone' do
      expect(@user).to respond_to(:time_zone)
    end
  end

  context 'associations' do
    it 'has a log' do
      expect(@user).to respond_to(:log)
    end

    it 'has a log associated on creation' do
      expect(@user.log).to be_a(Log)
    end
  end

  context 'validations' do
    it 'requires an email' do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to have(1).error_on(:email)
    end

    it 'requires a password' do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to have(1).error_on(:password)
    end

    it 'requires a timezone' do
      user = FactoryGirl.build(:user, time_zone: nil)
      expect(user).to have(1).error_on(:time_zone)
    end
  end
end

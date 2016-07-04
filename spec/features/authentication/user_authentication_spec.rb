require 'rails_helper'

describe 'authentication' do

  before do
    Capybara.current_driver = :webkit
    @user = FactoryGirl.create(:user)
  end

  describe 'user sign in', :js => true do

    it 'allows users to sign in with right information' do
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      click_button "Sign In"

      expect(page).to have_content "Welcome #{@user.email}"
      expect(page).to have_link "Log out"
    end

    it 'does not allow users to sign in with incorrect information' do
    end

    it 'renders appropriate errors for incorrect sign in' do
    end

    it 'does not allow logged in users to access the sign inpage' do
    end

  end

  describe 'user sign up', :js => true do

    it 'allows users to sign up and redirects them to the home page' do
    end

    it 'does not allow users to sign up if they are missing a field' do
    end

    it 'does not let users sign up if their password is too short' do
    end

    it 'renders appropriate errors for missing fields or password length' do
    end

    it 'does not allow logged in users to access the sign up page' do
    end

  end

end

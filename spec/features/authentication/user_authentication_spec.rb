require 'rails_helper'

before do
  Capybara.javscript_driver = :webkit
end

describe 'user registration', :js => true do

  it 'allows users to register and redirects them to the home page' do
  end

  it 'does not allow users to register if they are missing a field' do
  end

  it 'does not let users register if their password is too short' do
  end

  it 'renders appropriate errors for missing fields or password length' do
  end

  it 'does not allow logged in users to access the page' do
  end

end

describe 'user login', :js => true do

  it 'allows users to log in with right information' do
  end

  it 'does not allow users to log in with incorrect information' do
  end

  it 'renders appropriate errors for incorrect login' do
  end

  it 'does not allow logged in users to access the page' do
  end

end

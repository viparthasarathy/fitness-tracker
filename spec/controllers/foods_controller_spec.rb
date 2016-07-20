require 'rails_helper'

describe FoodsController, :type => :controller do
  before do
    @entry = Entry.create(:entry)
    @user = @entry.user
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
  end

  describe 'POST #create' do
    before do
      @food_params = {name: "Burger", protein: 30, carbs: 30, fat: 20, calories: 600}
    end

    context 'logged in' do
      before do
        sign_in @user
      end

      it 'should return an error for invalid data' do
        @food_params[:name] = nil
        post :create, {:format => :json, :food => @food_params}
        expect(response.status).to eq(400)
        error_response = JSON.parse(response.body, symbolize_names: true)
        expect(error_response[:name][0]).to eq("cannot be blank")
      end

      it 'suceeeds with valid data' do
        post :create, {:format => :json, :food => @food_params}
        expect(response.status).to eq(201)
        expect(@entry.foods.count).to eq(1)
      end

      it 'should save the return the food info on success' do
        post :create, {:format => :json, :food => @food_params}
        food_response = JSON.parse(response.body, symbolize_names: true)
        expect(food_response[:name]).to eq("Burger")
      end
    end

    context 'logged out' do
      it 'should raise an authentication error' do
        post :create, {:format => :json, :food => @food_params}
        expect(response.status).to eq(401)
        expect(@entry.foods.count).to eq(0)
      end
    end
  end

  describe 'PUT #update' do
    context 'logged in' do
      context 'as owner' do
        it 'should return an error for invalid data'
        it 'should update the object for valid data'
      end

      context 'as other user' do
        it 'should raise an authorization error'
      end
    end

    context 'logged out' do
      it 'should raise an authentication error'
    end
  end

  describe 'DELETE #destroy' do
    context 'logged in' do
      context 'as owner' do
        it 'should delete the object'
      end

      context 'as other user' do
        it 'should raise an authorization error'
      end
    end

    context 'logged out' do
      it 'should raise an authentication error'
    end
  end
end

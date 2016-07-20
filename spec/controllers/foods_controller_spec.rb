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
        @food_params[:name] = ""
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
    before do
      @food = FactoryGirl.create(:food, entry: @entry)
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
        end

        it 'should return an error for invalid data' do
          @food_params[:protein] = nil
          put :update, {:format => :json, :id => @food.id, :food => @food_params}
          expect(response.status).to eq(400)
          error_response = JSON.parse(response.body, symbolize_names: true)
          expect(error_response[:protein][0]).to eq("cannot be blank")
        end

        it 'succeeds with valid data' do
          put :update, {:format => :json, :id => @food.id, :food => @food_params}
          expect(response.status).to eq(200)
        end

        it 'updates the value' do
          expect(@food.name).to eq("Pizza")
          put :update, {:format => :json, :id => @food.id, :food => @food_params}
          expect(@food.name).to eq("Burger")
        end

        it 'returns the updated food info on success' do
          expect(@food.name).to eq("Pizza")
          put :update, {:format => :json, :id => @food.id, :food => @food_params}
          food_response = JSON.parse(response.body, symbolize_names: true)
          expect(food_response[:id]).to eq(@food.id)
          expect(food_response[:name]).to eq("Burger")
        end
      end

      context 'as other user' do
        before do
          sign_in @other_user
        end

        it 'should raise an authorization error' do
          put :update, {:format => :json, :id => @food.id, :food => @food_params}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'should raise an authentication error' do
        put :update, {:format => :json, :id => @food.id, :food => @food_params}
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @food = FactoryGirl.create(:food, entry: @entry)
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
        end

        it 'should delete the object' do
          delete :destroy, {:format => :json, :id => @food.id}
          expect(response.status).to eq(204)
          expect(@entry.foods).to_not include(@food)
        end
      end

      context 'as other user' do
        before do
          sign_in @other_user
        end

        it 'should raise an authorization error' do
          delete :destroy, {:format => :json, :id => @food.id}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'should raise an authentication error' do
        delete :destroy, {:format => :json, :id => @food.id}
        expect(response.status).to eq(401)
      end

    end
  end
end

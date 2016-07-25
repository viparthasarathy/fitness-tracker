require 'rails_helper'

describe MeasurementsController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @chapter = FactoryGirl.create(:chapter, log: @user.log)
    @entry = FactoryGirl.create(:entry, chapter: @chapter)
    @other_user = FactoryGirl.create(:user, email: "hacker@yahoo.com")
  end

  describe 'POST #create' do
    before do
      @measurement_params = {entry_id: @entry.id, weight: 150, height: 70, waist: 30.5, chest: nil, bodyfat: 10.5}
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
        end

        it 'returns an error for invalid data' do
          @measurement_params[:height] = "very tall"
          post :create, {:format => :json, :measurement => @measurement_params}
          expect(response.status).to eq(400)
          error_response = JSON.parse(response.body, symbolize_names: true)
          expect(error_response[:height][0]).to eq("is not a number")
        end

        it 'succeeds with valid data' do
          post :create, {:format => :json, :measurement => @measurement_params}
          expect(response.status).to eq(201)
          expect(@entry.measurement).to_not eq(nil)
        end

        it 'returns the measurement info on success' do
          post :create, {:format => :json, :measurement => @measurement_params}
          measurement_response = JSON.parse(response.body, symbolize_names: true)
          expect(measurement_response[:weight]).to eq(150)
        end
      end

      context 'as other user' do
        before do
          sign_in @other_user
        end
        it 'raises an authorization error' do
          post :create, {:format => :json, :measurement => @measurement_params}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        post :create, {:format => :json, :measurement => @measurement_params}
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'PUT #update' do
    before do
      @measurement = FactoryGirl.create(:measurement, entry: @entry)
      @measurement_params = {entry_id: @entry.id, weight: 150, height: 70, waist: 30.5, chest: nil, bodyfat: 10.5}
    end

    context 'logged in' do
      context 'as owner' do
        before do
          sign_in @user
        end

        it 'returns an error for invalid data' do
          @measurement_params[:weight] = "very big"
          put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
          expect(response.status).to eq(400)
          error_response = JSON.parse(response.body, symbolize_names: true)
          expect(error_response[:measurement][0]).to eq("is not a number")
        end

        it 'succeeds with valid data' do
          put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
          expect(response.status).to eq(200)
        end

        it 'updates the value' do
          expect(@measurement.waist).to eq(nil)
          put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
          @measurement.reload
          expect(@measurement.waist).to eq(30.5)
        end

        it 'returns the updated measurement info on success' do
          expect(@measurement.bodyfat).to eq(15)
          put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
          measurement_response = JSON.parse(response.body, symbolize_names: true)
          expect(measurement_response[:bodyfat]).to eq(10.5)
        end
      end

      context 'as other user' do
        before do
          sign_in @other_user
        end

        it 'raises an authorization error' do
          put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises an authentication error' do
        put :update, {:format => :json, :id => @measurement.id, :measurement => @measurement_params}
        expect(response.status).to eq(401)
      end
    end
  end
end

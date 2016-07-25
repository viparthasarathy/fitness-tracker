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
          @measurement_params[:entry_id] = nil
          post :create, {:format => :json, :measurement => @measurement_params}
          expect(response.status).to eq(400)
          error_response = JSON.parse(response.body, symbolize_names: true)
          expect(error_response[:entry][0]).to eq("can't be blank")
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
        it 'raises an authorization error' do
          post :create, {:format => :json, :measurement => @measurement_params}
          expect(response.status).to eq(403)
        end
      end
    end

    context 'logged out' do
      it 'raises a validation error' do
        post :create, {:format => :json, :measurement => @measurement_params}
        expect(response.status).to eq(401)
      end
    end
  end

  describe 'PUT #update' do
    context 'logged in' do
      context 'as owner' do
        it 'returns an error for invalid data'
        it 'succeeds with valid data'
        it 'updates the value'
        it 'returns the updated measurement info on success'
      end

      context 'as other user' do
        it 'raises an authorization error'
      end
    end

    context 'logged out' do
      it 'raises a validation error'
    end
  end
end

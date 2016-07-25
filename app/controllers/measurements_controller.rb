class MeasurementsController < ApplicationController
  before_action :authenticate_user!

  def create
    @measurement = Measurement.new(measurement_params)
    authorize @measurement
    @measurement.save ? (render json: @measurement, status: 201) : (render json: @measurement.errors, status: 400)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:height, :weight, :bodyfat, :waist, :chest, :entry_id)
  end
end

class FoodsController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.new(food_params)
    authorize @food
    @food.save ? (render json: @food, status: 201) : (render json: @food.errors, status: 400)
  end

  def update
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, :protein, :carbs, :fats, :calories, :entry_id)
  end

end

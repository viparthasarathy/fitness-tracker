module Totals
  extend ActiveSupport::Concern

  def total_carbs
      self.foods.sum(:carbs)
  end

  def total_fats
      self.foods.sum(:fats)
  end

  def total_protein
      self.foods.sum(:protein)
  end

  def total_calories
      self.foods.sum(:calories)
  end

end

class FoodSerializer < ActiveModel::Serializer
  attributes :id, :calories, :fats, :carbs, :protein, :name
end

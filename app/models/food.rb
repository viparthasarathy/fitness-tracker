class Food < ActiveRecord::Base
  belongs_to :entry
  validates :entry, :name, presence: true
  validates :calories, :fats, :carbs, :protein, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end

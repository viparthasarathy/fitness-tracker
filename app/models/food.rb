class Food < ActiveRecord::Base
  belongs_to :entry
  validates :calories, :fats, :carbs, :protein, :entry, presence: true
end

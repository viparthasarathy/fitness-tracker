class Food < ActiveRecord::Base
  belongs_to :entry
  validates :name, :calories, :fats, :carbs, :protein, :entry, presence: true
end

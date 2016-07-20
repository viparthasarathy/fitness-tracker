class EntrySerializer < ActiveModel::Serializer
  attributes :id, :day, :notes, :total_calories, :total_fats, :total_protein, :total_carbs
  has_one :measurement
  has_many :foods
end

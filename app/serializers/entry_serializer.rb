class EntrySerializer < ActiveModel::Serializer
  attributes :id, :day, :notes
  has_one :measurement
  has_many :foods
end

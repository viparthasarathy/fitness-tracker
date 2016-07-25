class Measurement < ActiveRecord::Base
  belongs_to :entry
  validates :entry, presence: true
  validates :weight, :height, :waist, :chest, :bodyfat, numericality: { greater_than: 0, allow_nil: true}
end

class Measurement < ActiveRecord::Base
  belongs_to :entry
  validates :entry, presence: true
  validates :height, :waist, :chest, :bodyfat, numericality: { greater_than: 0, allow_nil: true}
  validates :weight, numericality: { greater_than: 0 }
end

class Measurement < ActiveRecord::Base
  belongs_to :entry
  validates :weight, :entry, presence: true
end

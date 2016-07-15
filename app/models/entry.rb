class Entry < ActiveRecord::Base
  belongs_to :chapter
  has_many :foods
  has_one :measurement
end

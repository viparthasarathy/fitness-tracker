class Chapter < ActiveRecord::Base
  validates :goal, :title, presence: true
  validates :goal, numericality: true
  belongs_to :log
  default_scope { order(:created_at => :desc) }
end

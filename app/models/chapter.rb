class Chapter < ActiveRecord::Base
  validates :goal, :title, :log, presence: true
  validates :goal, numericality: true
  belongs_to :log
  default_scope { order(:created_at => :desc) }
  has_many :entries
end

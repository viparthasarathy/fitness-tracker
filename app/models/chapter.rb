class Chapter < ActiveRecord::Base
  validates :goal, :title, presence: true
  belongs_to :log
  default_scope { order(:created_at => :desc) }
end

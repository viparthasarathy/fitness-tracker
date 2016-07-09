class Chapter < ActiveRecord::Base
  belongs_to :log
  default_scope { order(:created_at => :desc) }
end

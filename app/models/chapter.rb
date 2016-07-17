class Chapter < ActiveRecord::Base
  validates :goal, :title, :log, presence: true
  validates :goal, numericality: true
  belongs_to :log
  default_scope { order(:created_at => :desc) }
  has_many :entries
  has_many :foods, :through => :entries
  has_many :measurements, :through => :entries

  include Totals

end

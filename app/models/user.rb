class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :log
  after_create :create_log
  validates :time_zone, presence: true
end

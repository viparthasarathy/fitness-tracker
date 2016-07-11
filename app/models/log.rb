class Log < ActiveRecord::Base
  belongs_to :user
  has_many :chapters

  def latest_chapter
    chapters.first
  end

end

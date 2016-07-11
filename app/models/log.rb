class Log < ActiveRecord::Base
  belongs_to :user
  has_many :chapters

  def latest_chapter
    chapters.first
  end

  def has_chapter_in_progress
    latest_chapter && !latest_chapter.completed_at
  end

end

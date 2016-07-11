class Log < ActiveRecord::Base
  belongs_to :user
  has_many :chapters

  def previous_chapter
    chapters.second
  end

  def has_chapter_in_progress?
    previous_chapter && !previous_chapter.completed_at
  end

end

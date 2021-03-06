class Log < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  has_many :entries, :through => :chapters
  validates :user, presence: true

  def latest_chapter
    chapters.first
  end

  def has_chapter_in_progress?
    latest_chapter && !latest_chapter.completed_at
  end

  def latest_entry
    entries.first
  end

end

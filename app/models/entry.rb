class Entry < ActiveRecord::Base
  belongs_to :chapter
  has_many :foods
  has_one :measurement
  validates :day, :chapter, presence: true
  validate :date_related_validations

  private

  def cannot_be_before_chapter_start_date
    unless self.day.nil? || self.chapter.nil?
      errors.add(:day, "cannot come before chapter start date") if self.day < self.chapter.created_at.to_date
    end
  end

  def cannot_be_after_chapter_end_date
    unless self.day.nil? || self.chapter.nil? || self.chapter.completed_at.nil?
      errors.add(:day, "cannot come after chapter end date") if self.day > self.chapter.completed_at
    end
  end

  def date_related_validations
    cannot_be_before_chapter_start_date
    cannot_be_after_chapter_end_date
  end


end

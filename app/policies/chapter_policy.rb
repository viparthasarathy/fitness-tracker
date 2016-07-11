class ChapterPolicy < ApplicationPolicy

  def create?
    !record.log.previous_chapter_in_progress?
  end

end

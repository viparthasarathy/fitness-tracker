class ChapterPolicy < ApplicationPolicy

  def create?
    !record.log.has_chapter_in_progress?
  end

end

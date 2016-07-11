class ChapterPolicy < ApplicationPolicy

  def create?
    !record.log.previous_chapter_in_progress?
  end

  def show?
    record.log == user.log
  end

end

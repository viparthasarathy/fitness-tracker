class ChapterPolicy < ApplicationPolicy

  def create?
    !record.log.previous_chapter_in_progress?
  end

  def show?
    record.log == user.log
  end

  def update?
    record.log == user.log && !record.completed_at
  end

end

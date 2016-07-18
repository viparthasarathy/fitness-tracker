class ChapterPolicy < ApplicationPolicy

  def create?
    true
  end

  def show?
    record.log == user.log
  end

  def update?
    record.log == user.log && !record.completed_at
  end

end

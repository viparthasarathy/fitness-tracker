class EntryPolicy < ApplicationPolicy

  def create?
    record.chapter.log == user.log
  end

  def show?
    user.log == record.chapter.log
  end

end

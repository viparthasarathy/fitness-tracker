class EntryPolicy < ApplicationPolicy

  def create?
    record.chapter.log == user.log
  end

end

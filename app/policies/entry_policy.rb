class EntryPolicy < ApplicationPolicy

  def create?
    record.log == record.chapter.log
  end
  
end

class FoodPolicy < ApplicationPolicy

  def create?
    record.entry.chapter.log == user.log
  end

end

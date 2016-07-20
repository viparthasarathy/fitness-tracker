class FoodPolicy < ApplicationPolicy

  def create?
    record.entry.chapter.log == user.log
  end

  def update?
    record.entry.chapter.log == user.log
  end

  def destroy?
    record.entry.chapter.log == user.log
  end

end

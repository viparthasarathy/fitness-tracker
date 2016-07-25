class MeasurementPolicy < ApplicationPolicy

  def create?
    record.entry.chapter.log == user.log
  end

end

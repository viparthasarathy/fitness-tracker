class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :completed_at, :title, :description, :goal, :total_calories, :total_carbs, :total_fats, :total_protein, :last_weeks_measurements, :this_weeks_measurements
  has_many :entries
  has_many :measurements

  def last_weeks_entries
    if object.completed_at
      two_weeks_from_end = object.completed_at - 2.weeks
      one_week_from_end = object.completed_at - 1.week
      object.entries.where(day: two_weeks_from_end..one_week_from_end)
    else
      object.entries.where(day: 2.weeks.ago..1.week.ago)
    end
  end

  def this_weeks_entries
    if object.completed_at
      one_week_from_end = object.completed_at - 1.week
      object.entries.where(day: one_week_from_end..object.completed_at)
    else
      object.entries.where(day: 1.week.ago..Date.today)
    end
  end

  def last_weeks_measurements
    last_weeks_entries.map(&:measurement)
  end

  def this_weeks_measurements
    this_weeks_entries.map(&:measurement)
  end

end

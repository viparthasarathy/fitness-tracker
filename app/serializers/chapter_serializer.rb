class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :completed_at, :title, :description, :goal, :total_calories, :total_carbs, :total_fats, :total_protein, :last_weeks_entries, :this_weeks_entries
  has_many :entries
  has_many :measurements

  def last_weeks_entries
    object.entries.where(day: 2.weeks.ago..1.week.ago)
  end

  def this_weeks_entries
    object.entries.where(day: 1.week.ago..Date.today)
  end
end

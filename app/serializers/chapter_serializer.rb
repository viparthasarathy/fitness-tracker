class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :completed_at, :title, :description, :goal, :total_calories, :total_carbs, :total_fats, :total_protein
  has_many :entries

  def total_calories
    object.total_calories
  end

  def total_carbs
    object.total_carbs
  end

  def total_fats
    object.total_fats
  end

  def total_protein
    object.total_protein
  end

end

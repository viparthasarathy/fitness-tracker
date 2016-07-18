class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :completed_at, :title, :description, :goal
  has_many :entries
  class EntrySerializer < ActiveModel::Serializer
    attributes :id, :day
  end
end

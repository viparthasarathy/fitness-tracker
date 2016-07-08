class LogSerializer < ActiveModel::Serializer
  attributes :id
  has_many :chapters
  class ChapterSerializer < ActiveModel::Serializer
    attributes :id, :created_at, :completed_at, :title
  end

end

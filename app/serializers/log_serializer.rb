class LogSerializer < ActiveModel::Serializer
  attributes :id
  has_many :chapters
  class ChapterSerializer < ActiveModel::Serializer
    attributes :id, :completed_at
  end

end

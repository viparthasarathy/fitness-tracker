class LogSerializer < ActiveModel::Serializer
  attributes :id
  has_many :chapters
end

class LogSerializer < ActiveModel::Serializer
  attributes :id, :latest_entry
  has_many :chapters

  def latest_entry
    object.latest_entry
  end
end

class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :weight, :height, :waist, :chest, :bodyfat
end

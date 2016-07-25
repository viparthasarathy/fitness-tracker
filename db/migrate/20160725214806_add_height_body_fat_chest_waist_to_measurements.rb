class AddHeightBodyFatChestWaistToMeasurements < ActiveRecord::Migration
  def change
    add_column :measurements, :height, :float
    add_column :measurements, :bodyfat, :float
    add_column :measurements, :chest, :float
    add_column :measurements, :waist, :float
  end
end

class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.float :weight
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

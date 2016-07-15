class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :chapter, index: true, foreign_key: true
      t.date :day
      t.string :notes
      t.integer :total_calories
      t.integer :total_carbs
      t.integer :total_fats
      t.integer :total_protein

      t.timestamps null: false
    end
  end
end

class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fats
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

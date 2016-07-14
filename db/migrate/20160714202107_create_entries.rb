class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :chapter, index: true, foreign_key: true
      t.date :day
      t.string :notes

      t.timestamps null: false
    end
  end
end

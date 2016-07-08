class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.float :goal
      t.string :title
      t.text :description
      t.references :log, index: true, foreign_key: true
      t.date :completed_at
      t.timestamps null: false
    end
  end
end

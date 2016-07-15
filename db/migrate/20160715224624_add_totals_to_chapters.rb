class AddTotalsToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :total_calories, :integer
    add_column :chapters, :total_carbs, :integer
    add_column :chapters, :total_fats, :integer
    add_column :chapters, :total_protein, :integer
  end
end

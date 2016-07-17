class RemoveTotalsFromEntriesAndChapters < ActiveRecord::Migration
  def change
    remove_column :chapters, :total_calories, :integer
    remove_column :chapters, :total_carbs, :integer
    remove_column :chapters, :total_fats, :integer
    remove_column :chapters, :total_protein, :integer
    remove_column :entries, :total_calories, :integer
    remove_column :entries, :total_carbs, :integer
    remove_column :entries, :total_fats, :integer
    remove_column :entries, :total_protein, :integer
  end
end

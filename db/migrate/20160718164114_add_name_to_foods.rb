class AddNameToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :name, :string
  end
end

class ChangeChaptersCompletedAtFromDateToDateTime < ActiveRecord::Migration
  def change
    change_column :chapters, :completed_at, :datetime
  end
end

class ChangeDayFromDateToDateTimeForEntries < ActiveRecord::Migration
  def change
    change_column :entries, :day, :datetime
  end
end

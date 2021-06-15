class ChangeDataSearchesToSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :area, :integer
    change_column :schedules, :event_type, :integer
    change_column :schedules, :teacher, :integer
  end
end

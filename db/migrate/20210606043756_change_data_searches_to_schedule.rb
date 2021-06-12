class ChangeDataSearchesToSchedule < ActiveRecord::Migration[5.2]
  def change
    if Rails.env.development? || Rails.env.test?
      change_column :schedules, :area, :integer
      change_column :schedules, :event_type, :integer
      change_column :schedules, :teacher, :integer
    else Rails.env.production?
      change_column :schedules, :area, 'integer USING CAST(area AS integer)'
      change_column :schedules, :event_type, 'integer USING CAST(event_type AS integer)'
      change_column :schedules, :teacher, 'integer USING CAST(teacher AS integer)'
    end
  end
end

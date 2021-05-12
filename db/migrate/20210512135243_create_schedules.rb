class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.venue :string
      t.teacher :string
      t.course_name :string
      t.details :string
      t.image_name :string

      t.timestamps
    end
  end
end

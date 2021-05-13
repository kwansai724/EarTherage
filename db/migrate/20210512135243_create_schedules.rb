class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.string :place
      t.string :teacher
      t.string :course_name
      t.string :details
      t.string :image_name

      t.timestamps
    end
  end
end

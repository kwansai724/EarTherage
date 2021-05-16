class AddColumnToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :name, :string
    add_column :students, :course_type, :string
    add_column :students, :phone_number, :string
  end
end

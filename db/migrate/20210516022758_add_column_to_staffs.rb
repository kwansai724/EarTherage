class AddColumnToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :name, :string
    add_column :staffs, :admin, :boolean
  end
end

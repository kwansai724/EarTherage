class AddColumnToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :name, :string, null: false, default: ""
    add_column :staffs, :admin, :boolean, null: false, default: false
  end
end

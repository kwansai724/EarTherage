class AddStaffToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :staff_name, :string
  end
end

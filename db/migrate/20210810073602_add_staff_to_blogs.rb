class AddStaffToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :staff_name, :integer
  end
end

class ChangeDataContentToBlog < ActiveRecord::Migration[5.2]
  def change
    change_column :blog, :content, :text, limit: 10485760
  end
end

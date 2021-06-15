class ChangeDataContentToBlog < ActiveRecord::Migration[5.2]
  def change
    change_clomn :blog, :content, :text, limit: 4294967295
  end
end

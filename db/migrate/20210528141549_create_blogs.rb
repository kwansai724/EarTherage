class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.date :date
      t.string :image_name
      t.string :share_with
      t.references :staff, index: true, foreign_key: true

      t.timestamps
    end
  end
end

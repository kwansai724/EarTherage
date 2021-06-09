class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.datetime :datetime
      t.string :image
      t.string :share_with
      t.references :staff, index: true, foreign_key: true

      t.timestamps
    end
  end
end

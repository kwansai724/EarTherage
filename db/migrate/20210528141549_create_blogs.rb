class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title , null: false, default: ""
      t.datetime :datetime, null: false, default: DateTime.current
      t.text :content
      t.string :image
      t.integer :share_with, null: false, default: 0
      t.references :staff, index: true, foreign_key: true

      t.timestamps
    end
  end
end

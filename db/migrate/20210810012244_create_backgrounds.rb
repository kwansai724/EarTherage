class CreateBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :backgrounds do |t|
      t.string :image
      t.boolean :default, null: false, default: false

      t.timestamps
    end
  end
end

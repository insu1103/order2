class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :f_name
      t.integer :price
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end

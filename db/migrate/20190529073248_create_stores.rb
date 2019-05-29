class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :s_name
      t.integer :s_num
      t.string :s_add
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end

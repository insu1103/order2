class CreateBuckets < ActiveRecord::Migration[5.2]
  def change
    create_table :buckets do |t|
      t.integer :acount, default: 0
      t.integer :total, default: 0
      t.references :store, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end

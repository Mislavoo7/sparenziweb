class CreateLists < ActiveRecord::Migration[8.0]
  def change
    create_table :lists do |t|
      t.datetime :taken_at
      t.string :shop_name
      t.boolean :is_visible, default: true
      t.integer :position, default: 1000
      t.integer :user_id
      t.integer :total_price_in_cent, default: 0

      t.timestamps
    end
  end
end

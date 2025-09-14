class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.integer :list_id
      t.integer :app_id
      t.integer :price_in_cent, default: 0
      t.string :product_name
      t.string :company
      t.boolean :is_visible, default: true
      t.integer :position, default: 1000

      t.timestamps
    end
  end
end

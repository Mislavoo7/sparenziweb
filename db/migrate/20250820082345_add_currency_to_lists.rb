class AddCurrencyToLists < ActiveRecord::Migration[8.0]
  def change
    add_column :lists, :currency, :string, default: "€"
  end
end

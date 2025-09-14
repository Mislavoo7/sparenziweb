class AddAppSettingsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :theme, :string, default: "dark"
    add_column :users, :language_id, :string, default: "en"
    add_column :users, :currency, :string, default: "€"
  end
end

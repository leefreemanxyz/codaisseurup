class AddDefaultValuesToEvent < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :price, :decimal, default: 0
    change_column :events, :includes_food, :boolean, default: false
    change_column :events, :includes_drinks, :boolean, default: false
    change_column :events, :active, :boolean, default: true

  end
end

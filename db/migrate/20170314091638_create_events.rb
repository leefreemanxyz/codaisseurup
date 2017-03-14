class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price
      t.integer :capacity
      t.boolean :includes_food
      t.boolean :includes_drinks
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

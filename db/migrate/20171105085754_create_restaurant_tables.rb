class CreateRestaurantTables < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_tables do |t|
      t.boolean :available, default: true
      t.integer :table_no
      t.integer :accomodates

      t.timestamps
    end
  end
end

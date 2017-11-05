class AddReferencesRestaurantTableToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :restaurant_table, foreign_key: true
  end
end

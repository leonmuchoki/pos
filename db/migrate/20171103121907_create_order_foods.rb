class CreateOrderFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :order_foods do |t|
      t.integer :quantity
      t.decimal :amount
      t.references :order, foreign_key: true
      t.references :food, foreign_key: true

      t.timestamps
    end
  end
end

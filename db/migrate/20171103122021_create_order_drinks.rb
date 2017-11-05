class CreateOrderDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :order_drinks do |t|
      t.integer :quantity
      t.decimal :amount
      t.references :order, foreign_key: true
      t.references :drink, foreign_key: true

      t.timestamps
    end
  end
end

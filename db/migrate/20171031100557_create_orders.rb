class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.boolean :processed, default: false

      t.timestamps
    end
  end
end

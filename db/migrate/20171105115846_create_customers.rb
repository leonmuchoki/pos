class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :loyal_points
      t.integer :mobile
      t.string :address

      t.timestamps
    end
  end
end

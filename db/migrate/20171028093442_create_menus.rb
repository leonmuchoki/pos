class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.integer :food_id
      t.integer :drink_id

      t.timestamps
    end
  end
end

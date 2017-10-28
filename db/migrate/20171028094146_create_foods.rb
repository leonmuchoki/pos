class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end

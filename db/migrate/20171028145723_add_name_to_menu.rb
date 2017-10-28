class AddNameToMenu < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :name, :string
  end
end

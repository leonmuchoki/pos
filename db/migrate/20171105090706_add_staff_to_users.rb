class AddStaffToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :staff, :boolean, default: true
  end
end

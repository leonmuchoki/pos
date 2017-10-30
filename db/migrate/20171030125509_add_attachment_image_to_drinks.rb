class AddAttachmentImageToDrinks < ActiveRecord::Migration
  def self.up
    change_table :drinks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :drinks, :image
  end
end

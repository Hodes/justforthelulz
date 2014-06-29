class AddAttachmentAvatarToAuthors < ActiveRecord::Migration
  def self.up
    change_table :authors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :authors, :avatar
  end
end

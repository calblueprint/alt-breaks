class AddAttachmentCoverPhotoToTrips < ActiveRecord::Migration
  def self.up
    change_table :trips do |t|
      t.attachment :cover_photo
    end
  end

  def self.down
    drop_attached_file :trips, :cover_photo
  end
end

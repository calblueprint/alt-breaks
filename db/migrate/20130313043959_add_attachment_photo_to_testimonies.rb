class AddAttachmentPhotoToTestimonies < ActiveRecord::Migration
  def self.up
    change_table :testimonies do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :testimonies, :photo
  end
end

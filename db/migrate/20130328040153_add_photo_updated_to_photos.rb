class AddPhotoUpdatedToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :photo_updated_at, :datetime
  	remove_column :photos, :photo_update_at
  end
end

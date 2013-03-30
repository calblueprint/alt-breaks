class RemovePhotoUpdatedFromTestimony < ActiveRecord::Migration
  def up
  	remove_column :testimonies, :photo_updated_at
  end

  def down
  	add_column :testimonies, :photo_updated_at, :datetime
  end
end

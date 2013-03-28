class AddPaperclipToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :photo_file_name, :string
    add_column :photos, :photo_content_type, :string
    add_column :photos, :photo_file_size, :integer
    add_column :photos, :photo_update_at, :datetime
  end
end

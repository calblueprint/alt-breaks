class RemovePaperclipFromTestimony < ActiveRecord::Migration
  def up
    remove_column :testimonies, :photo_file_name
    remove_column :testimonies, :photo_content_type
    remove_column :testimonies, :photo_file_size
    remove_column :testimonies, :photo_update_at
  end

  def down
    add_column :testimonies, :photo_update_at, :datetime
    add_column :testimonies, :photo_file_size, :integer
    add_column :testimonies, :photo_content_type, :string
    add_column :testimonies, :photo_file_name, :string
  end
end

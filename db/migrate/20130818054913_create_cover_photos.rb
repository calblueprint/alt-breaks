class CreateCoverPhotos < ActiveRecord::Migration
  def change
    create_table :cover_photos do |t|
      t.attachment :photo
      t.string :page

      t.timestamps
    end
  end
end

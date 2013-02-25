class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :trip_instance_id
      t.text :description
      t.string :video_link

      t.timestamps
    end
  end
end

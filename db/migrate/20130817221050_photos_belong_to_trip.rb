class PhotosBelongToTrip < ActiveRecord::Migration
  def up
    add_column :photos, :trip_instance_id, :integer
    add_column :photos, :user_id, :integer
    remove_column :photos, :testimony_id
  end

  def down
    remove_column :photos, :trip_instance_id
    remove_column :photos, :user_id
    add_column :photos, :testimony_id, :integer
  end
end

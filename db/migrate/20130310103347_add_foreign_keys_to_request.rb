class AddForeignKeysToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :user_id, :integer
    add_column :requests, :trip_instance_id, :integer
  end
end

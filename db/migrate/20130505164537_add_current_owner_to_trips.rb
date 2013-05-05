class AddCurrentOwnerToTrips < ActiveRecord::Migration
  def change
    add_column :trip_instances, :current_owner_id, :integer
  end
end

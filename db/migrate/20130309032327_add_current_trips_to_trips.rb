class AddCurrentTripsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :current_trip_instance_id, :integer
  end
end

class AddTripIdToTripInstances < ActiveRecord::Migration
  def change
    add_column :trip_instances, :trip_id, :integer
  end
end

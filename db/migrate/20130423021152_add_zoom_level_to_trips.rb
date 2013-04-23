class AddZoomLevelToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :zoom_level, :integer
  end
end

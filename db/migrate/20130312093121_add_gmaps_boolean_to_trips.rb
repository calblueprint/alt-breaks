class AddGmapsBooleanToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :gmaps, :boolean #not mandatory, see wiki
  end
end

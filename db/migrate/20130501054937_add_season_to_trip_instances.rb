class AddSeasonToTripInstances < ActiveRecord::Migration
  def up
  	add_column :trip_instances, :season, :string
  end

  def down
  	remove_column :trip_instances, :season
  end
end

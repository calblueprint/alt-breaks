class AddNameToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :name, :string
  	add_column :trips, :subtitle, :string
  end
end
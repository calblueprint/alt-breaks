class CreatePartnersTripsTable < ActiveRecord::Migration
  def up
  	create_table :partners_trips, :id => false do |t|
        t.references :partner
        t.references :trip
    end
    add_index :partners_trips, [:partner_id, :trip_id]
    add_index :partners_trips, [:trip_id, :partner_id]
  end

  def down
  	drop_table :partners_trips
  end
end

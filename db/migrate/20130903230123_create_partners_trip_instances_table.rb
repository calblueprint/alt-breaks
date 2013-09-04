class CreatePartnersTripInstancesTable < ActiveRecord::Migration
  def up
    drop_table :partners_trips
    create_table :partners_trip_instances, :id => false do |t|
        t.references :partner
        t.references :trip_instance
    end
    add_index :partners_trip_instances, [:partner_id, :trip_instance_id]
    add_index :partners_trip_instances, [:trip_instance_id, :partner_id]
  end

  def down
    drop_table :partners_trip_instances
    create_table :partners_trips, :id => false do |t|
        t.references :partner
        t.references :trip
    end
    add_index :partners_trips, [:partner_id, :trip_id]
    add_index :partners_trips, [:trip_id, :partner_id]
  end
end

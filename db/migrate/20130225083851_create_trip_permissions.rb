class CreateTripPermissions < ActiveRecord::Migration
  def change
    create_table :trip_permissions do |t|
      t.integer :trip_instance_id
      t.integer :user_id
      t.integer :permission

      t.timestamps
    end
  end
end

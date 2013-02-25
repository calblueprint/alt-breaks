class CreateTripInstances < ActiveRecord::Migration
  def change
    create_table :trip_instances do |t|
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end

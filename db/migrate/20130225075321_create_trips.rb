class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end

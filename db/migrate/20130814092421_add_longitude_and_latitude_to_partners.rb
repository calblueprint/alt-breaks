class AddLongitudeAndLatitudeToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :longitude, :float
    add_column :partners, :latitude, :float
  end
end

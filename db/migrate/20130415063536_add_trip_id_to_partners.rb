class AddTripIdToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :trip_id, :integer
  end
end

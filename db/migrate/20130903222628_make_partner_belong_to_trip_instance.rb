class MakePartnerBelongToTripInstance < ActiveRecord::Migration
  def change
    remove_column :partners, :trip_id
    add_column :partners, :trip_instance_id, :integer
  end
end

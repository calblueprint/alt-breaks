class AddPartnerIdToPartners < ActiveRecord::Migration
  def change
  	add_column :partners, :partner_id, :integer
  end
end

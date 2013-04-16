class AddLogoToPartner < ActiveRecord::Migration
  def self.up
    change_table :partners do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :partners, :logo
  end
end

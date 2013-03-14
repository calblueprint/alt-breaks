class CreateAdminPermissions < ActiveRecord::Migration
  def change
    create_table :admin_permissions do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddTitleAndTypeToAdminPermissions < ActiveRecord::Migration
  def change
    remove_column :users, :title
    add_column :admin_permissions, :title, :string
    add_column :admin_permissions, :permission, :integer
  end
end

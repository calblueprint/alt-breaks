class ChangeContextColumnName < ActiveRecord::Migration
  def change
    rename_column :testimonies, :context, :description
  end
end

class AddPageIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page_id, :integer
  end
end

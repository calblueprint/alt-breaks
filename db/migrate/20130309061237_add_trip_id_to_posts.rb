class AddTripIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :trip_id, :integer
  end
end

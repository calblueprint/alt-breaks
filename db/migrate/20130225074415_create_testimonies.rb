class CreateTestimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.integer :trip_instance_id
      t.integer :user_id
      t.text :context

      t.timestamps
    end
  end
end

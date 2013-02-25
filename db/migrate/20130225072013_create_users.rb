class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grad_year
      t.string :major

      t.timestamps
    end
  end
end

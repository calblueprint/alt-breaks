class AddPdfToPosts < ActiveRecord::Migration
  def self.up
    add_attachment :posts, :pdf
  end
  def self.down
    remove_attachment :posts, :pdf
  end
end

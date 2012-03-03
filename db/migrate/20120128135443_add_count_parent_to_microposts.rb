class AddCountParentToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :count, :integer
    add_column :microposts, :parent, :integer
  end

  def self.down
    remove_column :microposts, :parent
    remove_column :microposts, :count
  end
end

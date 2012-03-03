class AddCountToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :peoplecount, :integer
  end

  def self.down
    remove_column :microposts, :peoplecount
  end
end

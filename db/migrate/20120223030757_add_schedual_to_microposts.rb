class AddSchedualToMicroposts < ActiveRecord::Migration
  def self.up
    add_column :microposts, :schedual, :datetime
  end

  def self.down
    remove_column :microposts, :schedual
  end
end

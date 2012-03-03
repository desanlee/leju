class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :comments, :post_id, :micropost_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end

end

class CreateApplylists < ActiveRecord::Migration
  def self.up
    create_table :applylists do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
	add_index :applylists, :micropost_id
    add_index :applylists, :user_id
    add_index :applylists, [:micropost_id, :user_id], :unique => true
  end

  def self.down
    drop_table :applylists
  end
end

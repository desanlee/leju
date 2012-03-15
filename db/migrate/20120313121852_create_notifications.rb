class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :user_id
      t.string :noti_type
      t.integer :target_id

      t.timestamps
    end
	
	add_index :notifications, [:user_id, :noti_type, :target_id], :unique => true

  end

  def self.down
    drop_table :notifications
  end
end

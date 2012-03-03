class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :micropost_id
      t.integer :user_id

      t.timestamps
    end
	add_index :applications, :micropost_id
    add_index :applications, :user_id
    add_index :applications, [:micropost_id, :user_id], :unique => true

  end

  def self.down
    drop_table :applications
  end
end

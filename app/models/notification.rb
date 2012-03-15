# == Schema Information
#
# Table name: notifications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  noti_type  :string(255)
#  target_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Notification < ActiveRecord::Base
	attr_accessible :user_id, :noti_type, :target_id
	validates_uniqueness_of :user_id, :scope => [:noti_type, :target_id]
	
	belongs_to :user
	
	validates :user_id, :presence => true
	validates :noti_type, :presence => true
	validates :target_id, :presence => true

	default_scope :order => 'notifications.created_at DESC'
end

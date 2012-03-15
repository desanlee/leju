# == Schema Information
#
# Table name: applications
#
#  id           :integer         not null, primary key
#  micropost_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Application < ActiveRecord::Base
	attr_accessible :micropost_id, :user_id 

	belongs_to :micropost
	belongs_to :user

	validates :micropost_id, :presence => true
	validates :user_id, :presence => true

end

class Application < ActiveRecord::Base
	attr_accessible :micropost_id, :user_id 

	belongs_to :micropost
	belongs_to :user

	validates :micropost_id, :presence => true
	validates :user_id, :presence => true

end

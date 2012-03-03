class Micropost < ActiveRecord::Base
	attr_accessible :content
	attr_accessible :peoplecount
	attr_accessible :parent
	attr_accessible :schedual

	belongs_to :user
	has_many :comments, :dependent => :destroy
	has_many :applylists, :foreign_key => "micropost_id", :dependent => :destroy
	has_many :applicants, :through => :applylists, :source => :user
	
	validates :content, :presence => true, :length => { :maximum => 200 }
	validates :user_id, :presence => true
	validates :peoplecount, :presence => true
	validates :schedual, :presence => true
	
	default_scope :order => 'microposts.parent DESC'
	default_scope :order => 'microposts.created_at DESC'
	
	def feed
		# This is preliminary. See Chapter 12 for the full implementation.
		Comment.where("post_id = ?", id)
	end
	

	def involved?(user)
		applylists.find_by_user_id(user)
	end

	def involve!(user)
		applylists.create!(:user_id => user.id)
	end
	
	def uninvolve!(user)
		applylists.find_by_user_id(user).destroy
	end
	
# Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

	 private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end
end



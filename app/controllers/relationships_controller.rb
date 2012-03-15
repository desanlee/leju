class RelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
	
	# ���ѱ���ע����
	@notification = @user.notifications.build(:noti_type => "newfollow", :target_id => current_user.id ) 
	@notification.save
	
    redirect_to users_path
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to users_path
  end
end

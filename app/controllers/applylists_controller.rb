class ApplylistsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:applylist][:micropost_id])
    @micropost.involve!(current_user)
	
	# 提醒活动发起人
	@notification = @micropost.user.notifications.build(:noti_type => "newin", :target_id => @micropost.id ) 
	@notification.save
	# 提醒所有报名者
	@micropost.applicants.each do |a|
		if (a != @micropost.user && a != current_user)
			@notification = a.notifications.build(:noti_type => "newin", :target_id => @micropost.id ) 
			@notification.save
		end
	end
			
    redirect_to @micropost
  end

  def destroy
    @micropost = Applylist.find(params[:id]).micropost
    @micropost.uninvolve!(current_user)
    redirect_to @micropost
  end
end

class NotificationsController < ApplicationController
	before_filter :authenticate

	def create
		flash[:success] = "Notification created!"
	end

	def destroy
		@notification = Notification.find(params[:id])
		@notification.destroy
		redirect_back_or root_path
	end
  
  	def show
		@notification = Notification.find(params[:id])
		if (@notification.noti_type == "newfollow")
			@user = User.find_by_id(@notification.target_id)
			@notification.destroy
			redirect_to @user
		else
			@micropost = Micropost.find_by_id(@notification.target_id)
			@notification.destroy
			redirect_to @micropost
		end
	end
	
end

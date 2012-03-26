class CommentsController < ApplicationController  

  include ApplicationHelper
  
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy


  def create
    @comment  = current_user.comments.build(params[:comment])
	@comment.micropost_id = session[:current_micropost_id] 
	@micropost = Micropost.find_by_id(@comment.micropost_id)
	
    if @comment.save
		flash[:success] = "Comment created!"
		
		# 新发评论后，提醒计划制定者
		@notification = Notification.new(:user_id => @micropost.user_id, :noti_type => "newcmt", :target_id => @micropost.id ) 
		@notification.save
		# 新发评论后，提醒所有评论过此计划的人
		@micropost.comments.each do |c|
			@notification = Notification.new(:user_id => c.user_id, :noti_type => "newcmt", :target_id => @micropost.id ) 
			@notification.save
		end
			
		redirect_to @micropost
    else
		@feed_items = []
		flash[:success] = "Comment is not created!"
		redirect_to @micropost
    end
  end

  def destroy
    @comment.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_path if @comment.nil?
    end
end


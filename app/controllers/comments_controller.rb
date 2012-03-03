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


class MicropostsController < ApplicationController

  include ApplicationHelper
  
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

	def show
		@micropost = Micropost.find(params[:id])
		@user = current_user
		@comments = @micropost.comments
		@comment = Comment.new if signed_in?
		session[:current_micropost_id] = @micropost.id
	end
	
	def edit
		@micropost = Micropost.find(params[:id])
		@user = current_user
		@title = "Edit Micropost"
	end
	
	def update
		@micropost  = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'pages/home'
		end
	end
	
	def create
		@micropost  = current_user.microposts.build(params[:micropost])
		if @micropost.save
			@micropost.parent = @micropost.id
			@micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_back_or root_path
	end
	
	private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end


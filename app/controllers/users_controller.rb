# encoding: utf-8

class UsersController < ApplicationController
	before_filter :authenticate, :except => [:show, :new, :create]
	before_filter :correct_user, :only => [:edit, :update]
	
	def index
		@title = "All users"
		@users = User.paginate(:page => params[:page])
	end

	def show
		@user = User.find(params[:id])
		@title = @user.name
		@microposts = @user.microposts.paginate(:page => params[:page])
	end

	def new
		@user = User.new
		@title = "Sign up"
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "欢迎来到乐聚的空间! 请选择要关注的朋友！"
			redirect_to users_path
		else
			@title = "Sign up"
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
		@title = "Edit user"
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "个人信息更改成功！"
			redirect_to @user
		else
			@title = "Edit user"
			render 'edit'
		end
	end

	def following
		@title = "关注"
		@user = User.find(params[:id])
		@users = @user.following.paginate(:page => params[:page])
		render 'show_follow' 
	end

	def followers
		@title = "粉丝"
		@user = User.find(params[:id])
		@users = @user.followers.paginate(:page => params[:page])
		render 'show_follow' 
	end

	private

    def authenticate
		deny_access unless signed_in?
    end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
    end

end

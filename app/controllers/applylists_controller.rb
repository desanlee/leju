class ApplylistsController < ApplicationController

  def create
    @micropost = Micropost.find(params[:applylist][:micropost_id])
    @micropost.involve!(current_user)
    redirect_to @micropost
  end

  def destroy
    @micropost = Applylist.find(params[:id]).micropost
    @micropost.uninvolve!(current_user)
    redirect_to @micropost
  end
end

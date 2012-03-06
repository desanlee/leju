class PagesController < ApplicationController
  def home
  	@title = "Home"
	@micropost = Micropost.new if signed_in?
	@feed_items = current_user.feed.paginate(:page => params[:page]) if signed_in?
	@feed_items_color = 0
	@feed_items_parent = 0
  end

  def contact
    @title = "Contact"
  end

  def about
  	@title = "About"
  end
  
end

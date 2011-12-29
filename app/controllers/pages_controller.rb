class PagesController < ApplicationController
  def home
	@user = User.new
  	@title = "Home"
  end

  def contact
    @title = "Contact"
  end

	def about
  	@title = "About"
  end
  
end

class HomeController < ApplicationController

	def home
      redirect_to contents_path if logged_in? 
	end
	


end

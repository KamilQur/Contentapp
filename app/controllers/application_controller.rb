class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #methods that you create in the application controller are available to all controllers 
  protect_from_forgery with: :exception
    layout "application"
 #access control are also done in application controller 

helper_method :current_user, :logged_in?

def current_user 
	#it will return the current user if it is regestered 
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
end


 
def logged_in?
   !!current_user  
end 	


end

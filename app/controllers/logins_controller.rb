 class LoginsController < ApplicationController
	
 def new

 end
 
 def create 
  #find_by finds existing users in the database  
  user = User.find_by(email:params[:email])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id 
   	flash[:success] = "You are logged in"
   	redirect_to contents_path
 
   else
   	flash.now[:danger] = "Your email or password does not match"
   	render 'new' 
 end 
 end 
 
 def destroy 
  session[:user_id] = nil
  flash[:success] = "You have logged out"
  redirect_to root_path 
 end 	
 
 
# Sessions are not backed by models so we will not create any crud action 
# Your User information is stored in a session and session is stored in a browser
# The Browser has a cokkie(user information) which stores this information in 
#the session and  becomes invalidated when you logout   




end
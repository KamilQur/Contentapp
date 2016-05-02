 class UsersController < ApplicationController
  before_action :set_user ,only:[:edit,:update,:show]
	before_action :require_same_user, only: [:edit,:update] 
 
  def send_message
  end

  def new
    @user = User.new  

    if unsigned_mode?
        @unsigned = true
        # make sure we have the appropriate preset
        @preset_name = "sample_" + Digest::SHA1.hexdigest(Cloudinary.config.api_key + Cloudinary.config.api_secret)
        begin                             
          preset = Cloudinary::Api.upload_preset(@preset_name)
          if !preset["settings"]["return_delete_token"]
            Cloudinary::Api.update_upload_preset(@preset_name, :return_delete_token=>true)
          end
        rescue
          # An upload preset may contain (almost) all parameters that are used in upload. The following is just for illustration purposes
          Cloudinary::Api.create_upload_preset(:name => @preset_name, :unsigned => true, :folder => "preset_folder", :return_delete_token=>true)
        end
      end

  end


  def register_author
  	@user = User.new
  end


  def register_reader
 	@user = User.new
  end
 
 
   def register
  	@user = User.new(user_params)
  	if @user.save
  		if params[:user_type] == "author"
        flash[:success] = "Your author account has been created successfully"
  			Author.create(user_id: @user.id)
        session[:user_id] = @user.id 

  		else
      flash[:success] = "Your reader account has been created successfully"
  			Reader.create(user_id: @user.id)
        session[:user_id] = @user.id  
   
  		end
       redirect_to contents_path 
  	end    
  end


  def edit 

  end 

 
   def update 
    if @user.update(user_params)
      flash[:success] = "Your profile has beeem updated successfully"
      redirect_to user_path(@user)
    else   
      render 'edit' 
   end
   end
  

   def show 

   end
 
  
  def destroy
    @user = User.find_by_id(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "User deleted."
    end
  end
 
   
 
 

  def index
   @users = User.all 
  end

  private 
  def user_params
  	params.require(:user).permit(:email, :name, :password, :image)
  end
 

  def set_user
    @user = User.find(params[:id])
  end  


  def require_same_user
   if current_user != @user
    flash[:danger] = "You can edit your own profile"
    redirect_to register_author_users_path 
  end
 end
 


 

 

 end 














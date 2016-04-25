
class ContentsController < ApplicationController
  
 before_action :set_content, only: [:edit,:update,:show,:destroy]
 before_action :require_user, except:[:show,:index] 
 before_action :require_same_user, only: [:edit,:update,:destroy]
 before_action :is_current_user_author, only: [:edit, :create, :new]

	def index 
		@contents = Content.paginate(page: params[:page], per_page: 5)
	end
 
 
	def show  

	end	 


    def new
      @content = Content.new

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


    def update
        if @content.update(content_params)
            flash[:success] = "Content Description has been updated succesfully"
            redirect_to content_path(@content) 
        else
            render :edit 
      end
    end	



# Creation form submission is handled by he create action 
    def create
        @content = Content.new(content_params)
        @content.author_id = current_user.author.id
        if @content.save 
            flash[:success] = "Your content is created successfully"
            redirect_to contents_path(@content) 
          else
            render:new 
       end     
    end	
 
   
  
   def edit 

   end


 
  def destroy 
    @content.destroy 
    redirect_to contents_path(@content)

  end   


  protected
  

  def direct_upload_mode?
    params[:direct].present?
  end
  

  def unsigned_mode?
    params[:unsigned].present?
  end
  

  def view_for_new
    direct_upload_mode? ? "new_direct" : "new"
  end

  
  private 

  def is_current_user_author
    if current_user && current_user.is_reader?
      redirect_to contents_path 
    end
  end

  def content_params
    params.require(:content).permit(:name,:description, :file, :category_id)
  end

  def set_content 
     @content = Content.find(params[:id]) 
  end 

  def require_same_user 
    if current_user != @content.author.user 
      flash[:danger] = "You can only edit your own content and create by Signing Up"
      redirect_to contents_path 
  end
 end  

 
end 

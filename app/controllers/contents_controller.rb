
class ContentsController < ApplicationController
	def index 
		@contents = Content.all
	end


	def show
		@content = Content.find(params[:id])
	end	


    def new
       @content = Content.new 
    end	


    def update
        @content = Content.find(params[:id])
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
     @content = Content.find(params[:id]) 
   end
  
 private 

 def content_params
   params.require(:content).permit(:name,:description)
 end

  

end 

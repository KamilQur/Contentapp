 class CommentsController < ApplicationController

  def create
     @content = Content.find(params[:content_id])   
     @comment = @content.comments.new(comments_params)
     @comment.user_id = current_user.id

    respond_to do |format|
        if @comment.save
         format.html {redirect_to @content, notice: 'Comment was successfully created'}
         else
         format.html {render action: "new"}	
         end
    end 	
 end  	
 


 
 
 private 

    def comments_params
        params.require(:comments).permit(:body)
    end

end

 








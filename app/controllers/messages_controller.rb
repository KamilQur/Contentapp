class MessagesController < ApplicationController



def new
	@message = Message.new 
end

 
def create
 @message = Message.new(messages_params)
 @message.sender_id = current_user.id
  if @message.save
  	flash[:success] = "Message sent"
  	redirect_to contents_path  
  else
  	flash[:alert] = "Send Again"
  	render :new
  end
end	 
 

def index 
  @messages = Message.where(recipient_id: current_user.id)
end	



private 
 def messages_params
   params.require(:message).permit(:body, :recipient_id)
 end	








end

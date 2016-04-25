  class ReadersController < ApplicationController



 	def update
 		@reader = current_user.reader
 		if @reader
 			@reader.update(reader_params)
 		end
 		redirect_to user_path(current_user)
 	end

    

   




 	private 

 	def reader_params
 		params.require(:reader).permit(:interest)
 	end





 end 	





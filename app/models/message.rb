 class Message < ActiveRecord::Base

	belongs_to :sender, class_name: "User"  
	belongs_to :receiver, class_name: "User"
 
	# get all send messages

	# find_all_by_sender_id(user_id) it will return all the send messages 
	# 
	# find_all_by_sender_id(user_id) it will return all the send messages 
	# 










end 	
 class Comment < ActiveRecord::Base

  belongs_to :user  

  belongs_to :content 


 validates :user_id, presence: true 


 validates :content_id, presence: true 


 


 end	
class Reader < ActiveRecord::Base

 belongs_to :user 
 has_many :comments   
 

validates :user_id, presence: true 


end	
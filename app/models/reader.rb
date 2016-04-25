class Reader < ActiveRecord::Base

 belongs_to :user 


validates :user_id, presence: true 

	def show_interest
		Category.find_by_id(self.interest)  
	end













end	
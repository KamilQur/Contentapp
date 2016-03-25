class Author < ActiveRecord::Base


has_many :contents
belongs_to :user
  

validates :user_id, presence: true 



	def name
		user.name
	end


end	







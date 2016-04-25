class Content < ActiveRecord::Base

	belongs_to :author 
	belongs_to :category
	has_many :comments   


	# validates :author_id, presence: true 
	validates :name, presence: true,length:{minimum: 5, maximum: 100}
	validates :description,presence: true,length:{minimum:15,maximum:500}

	mount_uploader :file, FileUploader
 
 

end 

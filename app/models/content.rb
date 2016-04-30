class Content < ActiveRecord::Base

	belongs_to :author 
	belongs_to :category
	has_many :comments   


	# validates :author_id, presence: true 
	validates :name, presence: true,length:{minimum: 5, maximum: 100}
	validates :description,presence: true,length:{minimum:15,maximum:500}

	mount_uploader :file, FileUploader

	def self.get_feeds(user_id) 
		ids = User.find(user_id).following.map { |user| user.author.id }
		Content.where("author_id in (?)", ids).order(:created_at)
	end
 
  
end 

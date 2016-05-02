 class User < ActiveRecord::Base

has_one :author
has_one :reader  
has_many :comments   
has_many :messages

#This checks who you are following 
has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
          # ,dependent: :destroy
has_many :following, through: :active_relationships, source: :followed 
         
# This checks who is following you 
has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"
          # ,dependent: :destroy 
has_many :followers, through: :passive_relationships, source: :follower

 
 
before_save {self.email = email.downcase}   

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

validates :name, presence: true, length: {minimum: 3, maximum: 40 } 
validates :email, presence: true, length: {maximum:100} ,
										uniqueness: {case_sensitive: false},
										format: {with: VALID_EMAIL_REGEX}
# validates :image, presence: true
# validates :bytes, presence: true  

 

  validate :picture_size 

  mount_uploader :image, ImageUploader  

  
has_secure_password  

 def is_author?
 	self.author
 end

 def is_reader?
 	self.reader 
 end


 # You are following user
def follow(other)
 active_relationships.create(followed_id: other.id)
end

#unfollow a user
 def unfollow(other)
  	active_relationships.find_by(followed_id: other.id).destroy
 end  
  

  # checks whether you are following some user or not
 def following?(other)
   following.include?(other)
 end	
 
 

private
 def picture_size
 	if image.size > 5.megabytes
 		errors.add(:picture, "should be less than 5MB")
  end
 end  

 

end 	
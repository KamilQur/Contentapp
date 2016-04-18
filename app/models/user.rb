 class User < ActiveRecord::Base

has_one :author
has_one :reader  
has_many :comments   
has_many :messages 
#This checks who is following you  
#has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
 


before_save {self.email = email.downcase} 

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

validates :name, presence: true, length: {minimum: 3, maximum: 40 } 
validates :email, presence: true, length: {maximum:100} ,
										uniqueness: {case_sensitive: false},
										format: {with: VALID_EMAIL_REGEX}

validate :picture_size 

mount_uploader :picture, PictureUploader 


has_secure_password  
 
  
private
 def picture_size
 	if picture.size > 5.megabytes
 		errors.add(:picture, "should be less than 5MB")
  end
 end



end 	
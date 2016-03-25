 class User < ActiveRecord::Base

has_one :author
has_one :reader  
has_many :messages 

before_save {self.email = email.downcase} 

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

validates :name, presence: true, length: {minimum: 3, maximum: 40 } 
validates :email, presence: true, length: {maximum:100} ,
										uniqueness: {case_sensitive: false},
										format: {with: VALID_EMAIL_REGEX}


accepts_nested_attributes_for :messages, allow_destroy: true

has_secure_password  
 
  



end 	
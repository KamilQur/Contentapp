class Relationship < ActiveRecord::Base


# follower are those people who are followingyou
 belongs_to :follower, class_name: "User"
# followed are those people who you followed 
 belongs_to :followed, class_name: "User"

 validates, :follower_id, presence: true
 validates, :followed_id, presence: true






 













end

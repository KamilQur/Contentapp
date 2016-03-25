  require 'test_helper'
 

class ContentTest < ActiveSupport::TestCase



def setup
 
@author = Author.create(:category => "Fiction")
@content = @author.contents.build(:name => "TestContent",:description => "This is the 
	testing of the content model")
end
     
  
 
 test "content should be valid" do 
   assert_not @content.valid?  
end


test "author_id should be present" do 
	@content.author_id = nil
	assert_not @content.valid?
end	

 
 test "name should be present" do   
	@content.name = "" 
	assert_not  @content.valid?
end	
 

test "name length should not be too long" do 
   @content.name = 'a' * 101
   assert_not @content.valid?

end	  
 
  
test "name lenth should not be too short" do
  @content.name = 'a' * 3
  assert_not @content.valid? 
end	

  

test "description must be present" do
   @content.description = ''
   assert_not @content.valid?
end

test "description must not be too long" do
  @content.description = 'a' * 502
  assert_not @content.valid?
end	


test "description must not be too short" do
  @content.description = 'a' * 10 
  assert_not @content.valid? 
end	










end























































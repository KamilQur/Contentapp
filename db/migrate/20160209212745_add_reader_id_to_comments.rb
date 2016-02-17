class AddReaderIdToComments < ActiveRecord::Migration
  def change
  	  	     add_column :comments, :reader_id, :integer   

  end
end

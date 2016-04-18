class AddSenderIdToUsers < ActiveRecord::Migration
  def change
  	  add_column :users, :sender_id, :integer   

  end
end

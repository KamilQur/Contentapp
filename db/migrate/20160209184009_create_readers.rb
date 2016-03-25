class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t| 
    	t.string  :interest
    	t.timestamps

    end 
  end
end

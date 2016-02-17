class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
    	t.string :Name
    	t.text   :description
    	t.timestamps


    end 
  end
end

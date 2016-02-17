class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
    	t.integer :followers  
    	t.string :category
    	t.timestamps


    end
  end
end

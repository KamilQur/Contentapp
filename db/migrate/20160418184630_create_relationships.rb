class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
    # Indexes are added to increase the efficiency of the table attributes 
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # From this compund attributes you can,t follow one person multiple times
    add_index :relationships, [:follower_id, :followed_id], unique: true

  end
end

















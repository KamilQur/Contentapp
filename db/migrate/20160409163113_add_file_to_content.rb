class AddFileToContent < ActiveRecord::Migration
  def change
    add_column :contents, :file, :string
  end
end

class AddCategoryIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :category_id, :integer
  end
end

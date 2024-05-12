class RemoveColumnFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :category_name, :text
  end
end

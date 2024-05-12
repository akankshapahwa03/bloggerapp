class RemoveColumnFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :category_id, :integer
  end
end

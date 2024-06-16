class DeleteColumnsFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :likeable_type, :string
    remove_column :likes, :likeable_id, :integer
  end
end

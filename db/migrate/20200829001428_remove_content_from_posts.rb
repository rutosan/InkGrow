class RemoveContentFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :name, :text
  end
end

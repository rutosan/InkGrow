class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :integer
    add_column :users, :uid, :integer
    add_column :users, :name, :integer
    add_column :users, :nickname, :integer
    add_column :users, :image, :integer
  end
end

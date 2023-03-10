class RemoveForeignKeysFromTables < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :posts
    remove_foreign_key :comments, :users
    remove_foreign_key :likes, :posts
    remove_foreign_key :likes, :users
    remove_foreign_key :posts, :users
  end
end

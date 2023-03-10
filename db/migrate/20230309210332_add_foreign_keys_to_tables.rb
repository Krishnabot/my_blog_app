class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :posts
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :likes, :posts
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :posts, :users, column: :user_id
  end
end

class RenamePostCounterInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :post_counter, :PostsCounter
  end
end


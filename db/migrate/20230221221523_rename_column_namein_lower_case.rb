class RenameColumnNameinLowerCase < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
    rename_column :posts, :Title, :title
    rename_column :posts, :Text, :text
    rename_column :comments, :Text, :text

  end
end

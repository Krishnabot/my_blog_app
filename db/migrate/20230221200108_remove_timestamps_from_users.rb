class RemoveTimestampsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :timestamp
  end
end

class RemoveUseridFromProtoimages < ActiveRecord::Migration
  def change
    remove_column :protoimages, :user_id, :references
  end
end

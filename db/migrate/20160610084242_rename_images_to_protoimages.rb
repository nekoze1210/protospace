class RenameImagesToProtoimages < ActiveRecord::Migration
  def change
    rename_table :images, :protoimages
  end
end

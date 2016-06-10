class AddRoleToProtoimages < ActiveRecord::Migration
  def change
    add_column :protoimages, :role, :integer
  end
end

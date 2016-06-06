class DropTablePrototypes < ActiveRecord::Migration
  def change
    drop_table :prototypes
  end
end

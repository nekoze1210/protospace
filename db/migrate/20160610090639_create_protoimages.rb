class CreateProtoimages < ActiveRecord::Migration
  def change
    create_table :protoimages do |t|
      t.integer :role, default: 0, null: false, limit: 1
      t.text :thumbnail
      t.references  :prototype, index: true
      t.timestamps
    end
  end
end

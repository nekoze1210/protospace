class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.references :prototype, index: true
      t.text       :thumbnail
      t.timestamps
    end
  end
end

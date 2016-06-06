class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string      :title
      t.string      :catch_copy
      t.text        :concept
      t.references  :user, index: true
      t.timestamps
    end
  end
end

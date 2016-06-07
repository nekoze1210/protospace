class Image < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader

  belongs_to :user
  belongs_to :prototype

end

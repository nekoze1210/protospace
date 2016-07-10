class Protoimage < ActiveRecord::Base
  mount_uploader :thumbnail, ProtoimageUploader

  enum role: %i(main sub)

  belongs_to :user
  belongs_to :prototype

  validates :role,
            inclusion: {in: Protoimage.roles.keys}

  validates :thumbnail, presence: true
end

class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :protoimages, dependent: :delete_all
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  accepts_nested_attributes_for :protoimages, allow_destroy: true

  acts_as_taggable

  def liked_by(user_id)
   likes.find_by(user_id: user_id)
  end
end

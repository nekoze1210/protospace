class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :protoimages, dependent: :delete_all

  validates :title, presence: true
  accepts_nested_attributes_for :protoimages, allow_destroy: true

end

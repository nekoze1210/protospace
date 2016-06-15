class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :protoimages

  validates :title, presence: true
  accepts_nested_attributes_for :protoimages

end

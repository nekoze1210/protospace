class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :protoimages

  accepts_nested_attributes_for :protoimages

end

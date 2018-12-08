class Package < ApplicationRecord
  # associations
  belongs_to :user
  has_one :property
  has_many :sold_properties

  # validations
  validates :template, presence: true
end

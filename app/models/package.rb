class Package < ApplicationRecord
  # associations
  has_one :property
  has_many :rental_units
  has_many :sold_properties

  # validations
  validates :template, presence: true
end

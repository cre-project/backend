class Package < ApplicationRecord
  # Associations
  has_one :property
  has_many :rental_units
  has_many :sold_properties

  # Validations
  validates :template, presence: true
end

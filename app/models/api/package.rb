class Api::Package < ApplicationRecord
  # associations
  belongs_to :user
  has_one :property
  has_many :sold_properties
  has_many :rented_units

  has_many :package_sold_properties
  has_many :sold_properties, :through => :package_sold_properties

  has_many :package_rented_units
  has_many :rented_units, :through => :package_rented_units

  # validations
  validates :template, presence: true
end

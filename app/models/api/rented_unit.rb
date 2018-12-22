class Api::RentedUnit < ApplicationRecord
  # associations
  belongs_to :user
  has_one :address

  has_many :package_rented_units
  has_many :packages, :through => :package_rented_units

  # mandatory fields
  validates :bedrooms, presence: true
  validates :current_rent, presence: true

  # positive fields
  validates_numericality_of :year_built, :greater_than => 0.0
  validates_numericality_of :current_rent, :greater_than => 0.0

  # number range
  validates :bedrooms, inclusion: { in: 0..4 }
  validates :bathrooms, inclusion: { in: [1, 1.5, 2, 2.5, 3],
    message: "%{value} is not a valid number for bathrooms" }
end

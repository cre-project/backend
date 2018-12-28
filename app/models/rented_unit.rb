class RentedUnit < ApplicationRecord
  belongs_to :user
  has_one :address

  has_many :package_rented_units
  has_many :packages, through: :package_rented_units

  validates :bedrooms, :current_rent, presence: true

  validates_numericality_of :current_rent, greater_than: 0.0

  validates :bedrooms, inclusion: { in: 0..4 }
  validates :bathrooms, inclusion: { in: [1, 1.5, 2, 2.5, 3] }

  validates :year_built, inclusion: { in: 1500..2050 }
end

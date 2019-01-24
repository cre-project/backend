class RentedUnit < ApplicationRecord
  belongs_to :user

  has_many :package_rented_units
  has_many :packages, through: :package_rented_units

  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

  validates :bedrooms, :current_rent, presence: true

  validates_numericality_of :current_rent, greater_than: 0.0

  validates :bedrooms, inclusion: { in: 0..4 }
  validates :bathrooms, inclusion: { in: [1, 1.5, 2, 2.5, 3] }, allow_nil: true

  validates :year_built, inclusion: { in: 0..2050 }, allow_nil: true
end

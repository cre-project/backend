class SoldProperty < ApplicationRecord
  belongs_to :user

  has_many :package_sold_properties
  has_many :packages, through: :package_sold_properties

  validates_numericality_of :sales_price, :num_units, :square_feet, :cap_rate, :grm, greater_than: 0, allow_nil: true

  validates :year_built, inclusion: { in: 1500..2050 }, allow_nil: true
end

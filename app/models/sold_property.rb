class SoldProperty < ApplicationRecord
  # positive fields
  validates_numericality_of :year_built, :greater_than => 0.0
  validates_numericality_of :rent, :greater_than => 0.0
  validates_numericality_of :sales_price, :greater_than => 0.0
  validates_numericality_of :num_units, :greater_than => 0.0
  validates_numericality_of :price_per_unit, :greater_than => 0.0
  validates_numericality_of :price_per_sf, :greater_than => 0.0
  validates_numericality_of :cap_rate, :greater_than => 0.0
  validates_numericality_of :grm, :greater_than => 0.0

  # number range
  validates :bedrooms, inclusion: { in: 0..4 }
  validates :bathrooms, inclusion: { in: [1, 1.5, 2, 2.5, 3],
    message: "%{value} is not a valid number for bathrooms" }
end

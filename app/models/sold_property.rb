class SoldProperty < ApplicationRecord
  # associations
  belongs_to :user
  has_one :address

  has_many :package_sold_properties
  has_many :packages, :through => :package_sold_properties

  # positive fields
  validates_numericality_of :sales_price, :greater_than => 0.0
  validates_numericality_of :num_units, :greater_than => 0.0
  validates_numericality_of :square_feet, :greater_than => 0.0
  validates_numericality_of :cap_rate, :greater_than => 0.0
  validates_numericality_of :grm, :greater_than => 0.0

  # number range
  validates :year_built, inclusion: { in: 1500..2050 }
end

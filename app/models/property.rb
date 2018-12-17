class Property < ApplicationRecord
  # associations
  belongs_to :user
  has_many :property_units
  has_one :address

  # mandatory fields
  validates :price, presence: true
  validates :apn, presence: true

  # positive fields
  validates_numericality_of :price, :greater_than => 0.0
  validates_numericality_of :number_of_stories, :greater_than => 0.0
  validates_numericality_of :lot_size, :greater_than => 0.0

  # number range
  validates :year_built, inclusion: { in: 1500..2050 }
end

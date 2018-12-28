class Property < ApplicationRecord
  belongs_to :user
  has_many :property_units
  has_one :address

  validates :price, :apn, presence: true

  validates_numericality_of :price, :number_of_stories, :lot_size, greater_than: 0

  validates :year_built, inclusion: { in: 1500..2050 }
end

class Property < ApplicationRecord
  belongs_to :user
  belongs_to :package, optional: true
  has_many :property_units

  validates :price, presence: true

  validates_numericality_of :price, :number_of_stories, :lot_size, greater_than: 0, allow_nil: true

  validates :year_built, inclusion: { in: 1500..2050 }, allow_nil: true
end

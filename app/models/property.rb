class Property < ApplicationRecord
  belongs_to :user
  belongs_to :package, optional: true
  has_many :property_units
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

  validates :price, presence: true

  validates_numericality_of :price, :number_of_stories, :lot_size, allow_nil: true
end

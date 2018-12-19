class Api::Package < ApplicationRecord
  # associations
  belongs_to :user
  has_one :property
  has_many :sold_properties
  has_many :rented_units

  # validations
  validates :template, presence: true
end

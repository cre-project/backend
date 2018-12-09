class Address < ApplicationRecord
  # mandatory fields
  validates :street_name, presence: true
  validates :city, presence: true
  validates :zip, presence: true
end

class Address < ApplicationRecord
  validates :street_name, presence: true
  validates :city, presence: true
  validates :zip, presence: true
end

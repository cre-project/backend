class Address < ApplicationRecord
  validates_presence_of :street_name
  validates_presence_of :city
  validates_presence_of :zip
end

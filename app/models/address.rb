class Address < ApplicationRecord
  validates :street, :city, :state, :zip, presence: true
end

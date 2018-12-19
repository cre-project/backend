class Api::Address < ApplicationRecord
  # mandatory fields
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end

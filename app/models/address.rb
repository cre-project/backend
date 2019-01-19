class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :street, :city, :state, :zip, presence: true
end

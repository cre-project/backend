class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, dependent: :destroy

  validates :street, :city, :state, :zip, presence: true
end

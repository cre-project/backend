class User < ApplicationRecord
  # associations
  has_many :packages
  has_many :properties
  has_many :sold_properties

  # mandatory fields
  validates :email, presence: true

  # unique fields
  validates :email, uniqueness: true, case_sensitive: false

  # us phone number
  validates_format_of :phone_number, with: /\d[0-9]{9}/, allow_nil: true
end

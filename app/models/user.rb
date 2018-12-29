class User < ApplicationRecord
  has_secure_password :validations => false

  has_many :packages
  has_many :properties
  has_many :sold_properties
  has_many :rented_units

  validates :email, presence: true

  validates :email, uniqueness: true, case_sensitive: false

  validates_format_of :phone_number, with: /\d[0-9]{9}/, allow_nil: true
  validates_format_of :fax, with: /\d[0-9]{9}/, allow_nil: true
end

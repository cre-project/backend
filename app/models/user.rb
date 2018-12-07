class User < ApplicationRecord
  # mandatory fields
  validates :email, presence: true

  # unique fields
  validates :email, uniqueness: true, case_sensitive: false

  # us phone number
  validates_format_of :phone_number, with: /\d[0-9]{9}/
end

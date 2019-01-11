class User < ApplicationRecord
  has_secure_password :validations => false

  has_many :packages
  has_many :properties
  has_many :sold_properties
  has_many :rented_units
  has_many :addresses, dependent: :destroy
  has_one :company
  accepts_nested_attributes_for :company, allow_destroy: true

  validates :email, presence: true

  validates :email, uniqueness: true, case_sensitive: false

  validates_format_of :phone_number, with: /\d[0-9]{9}/, allow_nil: true
  validates_format_of :fax, with: /\d[0-9]{9}/, allow_nil: true

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end

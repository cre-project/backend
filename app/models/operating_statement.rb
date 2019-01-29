class OperatingStatement < ApplicationRecord
  belongs_to :package, dependent: :destroy
  has_many :operating_statement_fields

  validates :vacancy, inclusion: { in: 0..100 }, allow_nil: true
  validates :taxes, inclusion: { in: 0..100 }, allow_nil: true
  validates :mgmt_fee, inclusion: { in: 0..100 }, allow_nil: true
end

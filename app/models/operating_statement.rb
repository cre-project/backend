class OperatingStatement < ApplicationRecord
  belongs_to :package, dependent: :destroy
  has_many :operating_statement_fields
end

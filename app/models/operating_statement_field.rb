class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement

  validates :name, :is_income, presence: true
end

class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement, dependent: :destroy

  validates :name, :is_income, presence: true
end

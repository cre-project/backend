class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement
  validates :name, presence: true
  validates_inclusion_of :is_income, in: [true, false]
end

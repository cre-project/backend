class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement, dependent: :destroy
  validates :name, presence: true
  validates_inclusion_of :is_income, in: [true, false]
end

class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement
  validates :name, presence: true
end

class OperatingStatementField < ApplicationRecord
  belongs_to :operating_statement, dependent: :destroy
  validates :name, presence: true
end

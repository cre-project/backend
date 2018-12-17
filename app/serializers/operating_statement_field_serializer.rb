class OperatingStatementFieldSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_value, :potential_value, :is_income
  has_one :operating_statement
end

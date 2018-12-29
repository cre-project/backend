class AddDependenciesToOperatingStatementField < ActiveRecord::Migration[5.2]
  def change
    add_reference :operating_statement_fields, :operating_statement, type: :uuid, foreign_key: true
  end
end

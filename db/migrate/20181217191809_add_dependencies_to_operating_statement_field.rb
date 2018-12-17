class AddDependenciesToOperatingStatementField < ActiveRecord::Migration[5.2]
  def change
    add_column :operating_statement_fields, :operating_statement_id, :uuid
  end
end

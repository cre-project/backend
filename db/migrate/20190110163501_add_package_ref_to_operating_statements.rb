class AddPackageRefToOperatingStatements < ActiveRecord::Migration[5.2]
  def change
    add_reference :operating_statements, :package, type: :uuid, foreign_key: true
  end
end

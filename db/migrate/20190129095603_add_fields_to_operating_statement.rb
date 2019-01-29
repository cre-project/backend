class AddFieldsToOperatingStatement < ActiveRecord::Migration[5.2]
  def change
    add_column :operating_statements, :vacancy, :float
    add_column :operating_statements, :taxes, :float
    add_column :operating_statements, :taxes_label, :string
    add_column :operating_statements, :mgmt_fee, :float
    add_column :operating_statements, :mgmt_fee_label, :string
  end
end

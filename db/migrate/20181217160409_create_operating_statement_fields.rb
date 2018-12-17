class CreateOperatingStatementFields < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_statement_fields do |t|
      t.string :name
      t.float :current_value
      t.float :potential_value
      t.boolean :is_income, default: false

      t.timestamps
    end
  end
end

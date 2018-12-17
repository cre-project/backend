class CreateOperatingStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_statements, id: :uuid do |t|

      t.timestamps
    end
  end
end

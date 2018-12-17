class AddDependenciesToPropertyUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :property_units, :property_id, :uuid
  end
end

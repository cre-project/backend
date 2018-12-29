class AddDependenciesToPropertyUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :property_units, :property, type: :uuid, foreign_key: true
  end
end

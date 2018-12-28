class RemoveUnnecessaryDependencies < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :rented_unit_id
    remove_column :packages, :sold_property_id
  end
end

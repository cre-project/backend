class AddDependenciesToPackageRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_reference :package_rented_units, :package, type: :uuid, foreign_key: true
    add_reference :package_rented_units, :rented_unit, type: :uuid, foreign_key: true
  end
end

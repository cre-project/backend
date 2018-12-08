class RemovePackageIdFromRentedUnits < ActiveRecord::Migration[5.2]
  def change
    remove_column :rented_units, :package_id, :integer
  end
end

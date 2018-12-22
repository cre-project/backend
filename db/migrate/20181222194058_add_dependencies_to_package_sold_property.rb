class AddDependenciesToPackageSoldProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :package_sold_properties, :package_id, :uuid
    add_column :package_sold_properties, :sold_property_id, :uuid
  end
end

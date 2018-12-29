class AddDependenciesToPackageSoldProperty < ActiveRecord::Migration[5.2]
  def change
    add_reference :package_sold_properties, :package, type: :uuid, foreign_key: true
    add_reference :package_sold_properties, :sold_property, type: :uuid, foreign_key: true
  end
end

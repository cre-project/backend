class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :template
      t.integer :property_id
      t.integer :rented_unit_id
      t.integer :sold_property_id

      t.timestamps
    end
  end
end

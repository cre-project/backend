class CreatePackageSoldProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :package_sold_properties, id: :uuid do |t|

      t.timestamps
    end
  end
end

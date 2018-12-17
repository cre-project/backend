class CreateSoldProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_properties, id: :uuid do |t|
      t.integer :year_built
      t.float :sales_price
      t.integer :num_units
      t.float :cap_rate
      t.float :grm
      t.date :close_of_escrow
      t.string :image_url
      t.float :square_feet

      t.timestamps
    end
  end
end

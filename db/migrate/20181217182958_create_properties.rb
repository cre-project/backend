class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties, id: :uuid do |t|
      t.string :name
      t.integer :year_built
      t.integer :number_of_stories
      t.float :lot_size
      t.string :apn
      t.float :price
      t.float :total_square_feet

      t.timestamps
    end
  end
end

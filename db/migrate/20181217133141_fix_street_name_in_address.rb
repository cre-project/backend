class FixStreetNameInAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :street_name, :street
    remove_column :addresses, :street_number, :string
  end
end

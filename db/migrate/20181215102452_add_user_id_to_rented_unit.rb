class AddUserIdToRentedUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :rented_units, :user_id, :integer
  end
end

class AddDependenciesToSoldProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :sold_properties, :user, type: :uuid, foreign_key: true
    add_reference :sold_properties, :address, type: :uuid, foreign_key: true
  end
end

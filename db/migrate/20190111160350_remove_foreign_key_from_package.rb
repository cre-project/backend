class RemoveForeignKeyFromPackage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :packages, :property, type: :uuid, foreign_key: true
  end
end

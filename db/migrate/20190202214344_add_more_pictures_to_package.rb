class AddMorePicturesToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :property_image_1, :string
    add_column :packages, :property_image_2, :string
    add_column :packages, :property_image_3, :string
    add_column :packages, :property_image_4, :string
  end
end
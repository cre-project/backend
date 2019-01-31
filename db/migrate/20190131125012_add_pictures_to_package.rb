class AddPicturesToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :cover_image_url, :string
    add_column :packages, :information_image_url, :string
    add_column :packages, :table_of_contents_image_url, :string
    add_column :packages, :property_information_cover_image_url, :string
    add_column :packages, :property_information_image_url, :string
    add_column :packages, :property_photos_cover_image_url, :string
    add_column :packages, :recent_sales_cover_image_url, :string
    add_column :packages, :rent_comparables_cover_image_url, :string
    add_column :packages, :pricing_cover_image_url, :string
    add_column :packages, :closing_cover_image_url, :string
  end
end

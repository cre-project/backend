class AddImageUrlsToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :image_urls, :string, array: true, default: []
  end
end

class Api::PackageSoldProperty < ApplicationRecord
  belongs_to :package
  belongs_to :sold_property
end

class Api::PackageRentedUnit < ApplicationRecord
  belongs_to :package
  belongs_to :rented_unit
end

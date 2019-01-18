class PropertyUnit < ApplicationRecord
  belongs_to :property

  validates :bedrooms, :bathrooms, :current_rent, presence: true

  validates_numericality_of :current_rent, greater_than: 0
  validates_numericality_of :potential_rent, greater_than: 0, allow_nil: true

  validates :bedrooms, inclusion: { in: 0..4 }
  validates :bathrooms, inclusion: { in: [1, 1.5, 2, 2.5, 3] }
end

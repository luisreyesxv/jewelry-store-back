class ItemMaterial < ApplicationRecord
  belongs_to :item
  belongs_to :material
  has_many :images
end

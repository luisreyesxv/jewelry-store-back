class ItemMaterialSerializer < ActiveModel::Serializer
  attributes :id
  has_one :item
  has_one :material
end

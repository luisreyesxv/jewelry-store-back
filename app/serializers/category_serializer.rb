class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :item_categories
  has_many :items, through: :item_categories
end

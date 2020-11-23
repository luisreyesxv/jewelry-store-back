class ItemSerializer < ActiveModel::Serializer
  attributes :name, :slug, :price, :active, :detail, :description

  has_many :orders
  has_many :images
  # has_many :item_materials
  has_many :materials, through: :item_materials
  # has_many :item_categories
  has_many :categories, through: :item_categories

  def slug
    return object.name.parameterize
  end

end

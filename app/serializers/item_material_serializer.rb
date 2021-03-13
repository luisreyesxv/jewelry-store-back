class ItemMaterialSerializer < ActiveModel::Serializer
  attributes :name, :images
  has_one :image
  # has_one :item
  # has_one :material

  def name
    object.material.name
  end

  def images
     Image.all.where(item_material: object).map{|image| image.image_url}
  end
end

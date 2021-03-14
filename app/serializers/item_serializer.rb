class ItemSerializer < ActiveModel::Serializer
  attributes :name, :slug, :price, :active, :detail, :description, :images

  has_many :orders
  # has_many :item_materials
  # has_many :images, through: :item_materials
  has_many :materials, through: :item_materials
  # has_many :item_categories
  has_many :categories, through: :item_categories


  def images
  #   # Image.all.where(item_material: object).map{|image| image.image_url}

    ItemMaterial.all.where(item: object).to_h{|item_material|  
    
    [item_material.material.name.to_sym, item_material.images.map{|image| image.image_url}]
  }
  end

 



end

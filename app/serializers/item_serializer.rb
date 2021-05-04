class ItemSerializer < ActiveModel::Serializer
  attributes :name, :slug, :price, :active, :detail, :description, :extra, :category

  # has_many :item_materials
  # has_many :orders
  # has_many :images, through: :item_materials
  has_many :materials, through: :item_materials
  
  # has_many :item_categories
  # has_many :categories, through: :item_categories


  def extra
  #   # Image.all.where(item_material: object).map{|image| image.image_url}

  #   ItemMaterial.all.where(item: object).to_h{|item_material|  
    
  #   [item_material.material.name.to_sym, item_material.images.map{|image| image.image_url}] 
  # }
  ItemMaterial.includes(:material,:images).where(item: object).to_h{|item_material|  
    
    [item_material.material.name.to_sym, {id:item_material.id,images:
    item_material.images.map{|image| image.image_url}}] 
  }
  end

  def category
    ItemCategory.includes(:item,:category).find_by(item: object).category.name
  end

 



end

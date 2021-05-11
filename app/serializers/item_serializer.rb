class ItemSerializer < ActiveModel::Serializer
  attributes :name, :slug, :price, :active, :detail, :description, :extra, :category, :materials


  def materials
    object.materials.map{|material| {name: material.name}}
  end

  def extra
    object.item_materials.to_h{|item_material|  
    
      [item_material.material.name.to_sym, {id:item_material.id,images:
      item_material.images.map{|image| image.image_url}}] 
    }
  end


  def category
    object.categories[0].name
  end

 



end

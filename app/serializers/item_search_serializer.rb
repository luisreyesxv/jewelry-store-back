class ItemSearchSerializer < ActiveModel::Serializer
    attributes :title, :slug, :image, :material

   
  
  
    def title
        object.name
    end


    def image

        ItemMaterial.where(item: object).first.images.first.image_url
    end

    def material
         object.item_materials.first.material.name
    end

  
   
  
  
  
  end
class ItemMaterialSerializer < ActiveModel::Serializer
  attributes :material, :quantity

  belongs_to :item

  def material
    object.material.name
  end

  def quantity
    @instance_options[:quantity][:"#{object.id}"]
  end


end

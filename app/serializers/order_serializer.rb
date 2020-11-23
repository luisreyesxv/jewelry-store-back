class OrderSerializer < ActiveModel::Serializer
  attributes :id, :purchased_price, :delivery, :status, :order_date , :shipping_address
  belongs_to :user
  belongs_to :item


  def shipping_address
   
    return "#{object.street}, #{object.city}, #{object.state}, #{object.zip}, #{object.country}"

  end
end

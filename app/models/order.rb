class Order < ApplicationRecord
    belongs_to :user
    belongs_to :item_material




    def self.create_stripe_order(item_ids: , quantity:, token:, shipping: , user:)
        puts "this ran"
        items = ItemMaterial.includes(:item).find(item_ids)
        # items = ItemMaterial.includes(:item).find([445,446,447,448,449])
        sum,orders = Order.get_sum(items: items, quantity: quantity , shipping: shipping, user: user)

        charge = Stripe::Charge.create(

            amount: sum,
            description: "#{Rails.application.credentials[:mail][:frontend_name]} - #{Date.today}",
            currency: "usd",
            source: token,
            shipping: {
                name: "#{shipping[:firstName]} #{shipping[:lastName]}",
                address: {
                   line1: shipping[:street],
                   line2: shipping[:street2],
                   city: shipping[:city],
                   country: "US",
                   postal_code: shipping[:zip],
                   state: shipping[:state]
                }
            }   
        )

        Order.where(id: orders).update_all(status: "purchased", delivery: "pending", charge_confirmation: charge[:id])

  
            return items

    rescue
        Order.where(id: orders).update_all(status: "rejected", delivery: "rejected")
        return false

    end

    def self.tax_rate
        # this is where if I needed to have a dynamic tax rate, it should come up here. Could be based on state, or item, this should figure that out
        1.08875
    end
    
    def self.shipping_rate
        # this is where I could create a specific shipping_rate. Based on state, or shipping package they may add later
        25.00
    end


    private

    def self.get_sum(items: , quantity:, shipping: , user: )
        orders = []
       sum = items.sum do |item| 
        
        item_quantity = quantity[:"#{item[:id]}"]
        item_sum = item.item.price *  Order.tax_rate * item_quantity
        
    
         item_quantity.times do orders.push( Order.create(purchased_price: item_sum, item_material: item, order_date: DateTime.now,user: user, street: shipping[:street], city: shipping[:city], state: shipping[:state], zip: shipping[:zip], country: "US") ) end
        item_sum
    
       end

       sum+= Order.shipping_rate
      return  ( ('%.2f' % sum).to_f * 100).to_i ,orders
    end

   
end

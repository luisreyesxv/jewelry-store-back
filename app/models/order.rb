class Order < ApplicationRecord
    belongs_to :user
    belongs_to :item




    def self.create_stripe_order(item_ids: , quantity:, token:, shipping: )
        puts "this ran"
        items = ItemMaterial.includes(:item).find(item_ids)
        # items = ItemMaterial.includes(:item).find([445,446,447,448,449])
        sum = Order.get_sum(items: items, quantity: quantity)

        byebug

    end


    private

    def self.get_sum(items: , quantity:)
       items.sum{|item| (item.item.price *  Order.tax_rate) * quantity[:"#{item[:id]}"]}
    end

    def self.tax_rate
        # this is where if I needed to have a dynamic tax rate, it should come up here. Could be based on state, or item, this should figure that out
        1.08875
    end
    
end

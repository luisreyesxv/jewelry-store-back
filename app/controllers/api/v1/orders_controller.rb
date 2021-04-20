class API::V1::OrdersController < AuthorizationController
    def index
        orders = Order.all
        render json: orders
    end

    def create
        user = @user
        item_ids = cookies.signed[:cart][:items]
        quantity = cookies.signed[:cart][:quantity]


        Order.create_stripe_order(item_ids: item_ids , quantity: quantity, token: charge_params[:token], shipping: charge_params[:shipping])
        # items = Item.where(slug: orders_params[:items])

        line_items = items.map do |item|
    
                {currency: "USD",
                amount: item.price,
                name: item.nameluis 
            
            }
        end
    end

    def checkout
        
        items = find_item_materials
        cookies.signed[:cart] = {value: items, httponly: true}

        render json: items[:items] , quantity: items[:quantity]

        # the idea is to call find_item_materials, go through the params and get the quantities and item_materials. #checkout is supposed to reconfirm what the cart information 
        # is in a localized state and updates the cart with what the servers spits out. If they change anything, it should change the cart state and it should go through checkout again.
        # After that #checkout should send some kinda signed cookie with quantity and item_material ids (maybe just send quantities array). when it is confirmed, it should go to #create
        # which will actually call Stripe and refind those items again. make list items and kset them in order table.


    end


    private
    def orders_params
        params.require(:orders).permit(items: [ :name, :slug, :material, :image, :price, :id, :quantity])

    end

    def charge_params
        params.require(:orders).permit(:token, shipping: {}, billing: {})

        # params.require(:orders).permit(:token, shipping: {:firstName, :lastName, :street, :state, :zip}, billing: {:firstName, :lastName, :street, :state, :zip} )
    end

    def find_item_materials
        item_ids = []
        quantities = {}


        orders_params[:items].each do|item|
            item_ids.push(item[:id])
            quantities[:"#{item[:id]}"] = item[:quantity]
        end
        {items:  item_ids , quantity: quantities  }
    end

end

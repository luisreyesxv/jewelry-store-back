class API::V1::OrdersController < AuthorizationController
    def index
        orders = Orders.all
        render json: orders
    end

    def create
        user = @user
        item_ids = cookies.signed[:cart][:items]
        quantity = cookies.signed[:cart][:quantity]


       result = Order.create_stripe_order(user: user, item_ids: item_ids , quantity: quantity, token: charge_params[:token], shipping: charge_params[:shipping])
        if result
            OrderMailer.receipt(user, result,quantity).deliver_now
            cookies.delete(:cart)
            render json: {message: "success"}
        else
            render json: {error: "There was a problem charging the card. Please re-enter the CC and try again later"}, status: 401
        end

    end

    def checkout
        
        items, item_ids, quantity = find_item_materials
        cookies.signed[:cart] = {value: item_ids, httponly: true}

        render json: items , quantity: quantity

    end


    private
    def orders_params
        params.require(:orders).permit(items: [ :name, :slug, :material, :image, :price, :id, :quantity])

    end

    def charge_params
        params.require(:orders).permit(:token, shipping: {})
    end

    def find_item_materials
        item_ids = []
        quantities = {}


        orders_params[:items].each do|item|
            item_ids.push(item[:id])
            quantities[:"#{item[:id]}"] = item[:quantity]
        end

       return ItemMaterial.includes(:item, :material).where(id: item_ids),  item_ids ,  quantities  
    end

end

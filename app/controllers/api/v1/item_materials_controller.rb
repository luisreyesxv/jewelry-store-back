class API::V1::ItemMaterialsController < ApplicationController
 

    def show
        item_material = ItemMaterial.find(params[:id])
        render json: item_material, quantity: {"445":2,"554":1}
    end
end

class API::V1::ItemsController < ApplicationController
    def index
        items = Item.all
        render json:items
    end
end

class API::V1::CategoriesController < ApplicationController

    def index
               items = Item.includes(
                :item_categories,
                :categories,
                :materials,
                item_materials: [:material,:images]).where(categories: {name: params[:category].downcase}).paginate(page: params[:page],per_page: 10)

            #    items = Item.includes(:item_categories, :categories).where(categories: {name: params[:category].downcase}).paginate(page: params[:page],per_page: 10)
               #items.total_pages is a method available to us from will_paginate gem. It goes from items variable because we used Item.paginate
               render json: items , meta: {total_pages: items.total_pages} , adapter: :json


    end

end

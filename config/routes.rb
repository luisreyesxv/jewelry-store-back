Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :item_materials
      resources :item_categories
      resources :categories
      resources :materials
      resources :images
      resources :orders
      resources :items, param: :slug
      resources :users
    end
  end


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

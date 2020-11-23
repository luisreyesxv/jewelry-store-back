Rails.application.routes.draw do
  resources :item_materials
  resources :item_cate_gories
  resources :categories
  resources :materials
  resources :images
  resources :orders
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

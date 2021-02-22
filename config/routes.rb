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


      get "/users", to: "users#index"
      get "/users/id", to: "users#show"
      post "/login", to: "users#login"
      post "/register", to: "users#register"
      delete "/login", to:  "users#logout"
      post "/session", to: "users#session"
      get "/showcase", to: "items#showcase"

    end
  end


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

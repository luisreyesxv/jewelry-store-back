class API::V1::UsersController < ApplicationController
    skip_before_action :authorized
    
    def index
        # cookies.signed[:jwt] = {value: "swagberto", httponly: true}
        # cookies.delete(:jwt)
        users = User.all
        render json:users
    end

   
end

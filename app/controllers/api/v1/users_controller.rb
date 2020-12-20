class API::V1::UsersController < ApplicationController
    skip_before_action :authorized
    
    def index
        cookies.signed[:jwt] = {value: "this is the new cookie from visiting user with expiration time", httponly: true, expires: 10.second.from_now}
        # cookies.delete(:jwt)
        users = User.all
        render json:users
    end

    def show
        user = User.find_by(name: params[:id])
        render json: user
    end


    def register
        user = user.create(user_params)

        if user.valid?
            create_token(user)
            render json: user
        end

    end


    def login
        user = User.find_by(email: user_params[:email])

        if user && user.authenticate(user_params[:password])
            create_token(user)
            render json: user
        else
            render json: {error: "User/password combination does not exist, Please Try Again"}, status: :unauthorized
        end
    end

    def logout

        cooke.delete(:jwt)
        render head: :ok
    end

    private
    def user_params
        params.require(:user).permit(:name,:password,:email)
    end

    def create_token(user)
        token= encode_token(user_id: user.id)
        cookie.signed[:jwt] = {value: token, httponly: true, expires: 4.hour.from_now}
    end
   
end
